#include "astyle_instanceobj.h"
#include <qsciscintilla.h>

#include <QWidget>
#include <QMenu>
#include <QMessageBox>

#include <functional>
#include <qsciscintilla.h>
#include <Scintilla.h>

#include "astyle_main.h"

extern std::function<QsciScintilla* (QWidget*)> s_getCurEdit;
extern std::function<bool(QWidget*, int, void*)> s_invokeMainFun;

void AStyleInstanceObjErrorHandler(int errorNumber, const char* errorMessage)
{

}

char* AStyleInstanceObjMemoryAlloc(unsigned long memoryNeeded)
{
    return (char*) new char[memoryNeeded];
}

AStyleInstanceObj::AStyleInstanceObj(QWidget* pNotepad, QMenu* pMenu) :QObject(pNotepad)
{
	m_pNotepad = pNotepad;
	m_rootMenu = pMenu;
}

AStyleInstanceObj::~AStyleInstanceObj()
{

}

void AStyleInstanceObj::nddPrettyPrintCppFast()
{
    QsciScintilla* pEdit = s_getCurEdit(m_pNotepad);
    if (pEdit == nullptr)
    {
        return;
    }

    int length = (Sci_PositionCR)pEdit->SendScintilla(SCI_GETLENGTH, 0, (long)0);
    char* text = new char[length + sizeof(char)];
    if (text == NULL) return;  // allocation error, abort check
    text[length] = 0;
    pEdit->SendScintilla(SCI_GETTEXT, length + sizeof(char), text);

    const char* options =
        "--style=allman --indent=spaces=4 --pad-oper --pad-header --align-pointer=name --break-blocks";
    // call the C++ formatting function
    char* textOut = AStyleMain(text, options, AStyleInstanceObjErrorHandler, AStyleInstanceObjMemoryAlloc);
    // if an error message occurred it was displayed by errorHandler
    if (textOut != NULL)
    {
        pEdit->SendScintilla(SCI_SETTEXT, (uintptr_t)0, textOut);
        delete[]textOut;
    }
    delete[]text;
}

