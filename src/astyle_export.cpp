
#include <qobject.h>
#include <qstring.h>
#include <pluginGl.h>
#include <functional>
#include <qsciscintilla.h>
#ifdef WIN32
#include <Windows.h>
#endif

#include "astyle_instanceobj.h"

#define NDD_EXPORTDLL

#if defined(Q_OS_WIN)
#if defined(NDD_EXPORTDLL)
#define NDD_EXPORT __declspec(dllexport)
#else
#define NDD_EXPORT __declspec(dllimport)
#endif
#endif

#ifdef __cplusplus
	extern "C" {
#endif

	NDD_EXPORT bool NDD_PROC_IDENTIFY(NDD_PROC_DATA* pProcData);
	NDD_EXPORT int NDD_PROC_MAIN(QWidget* pNotepad, const QString& strFileName, std::function<QsciScintilla* (QWidget*)>getCurEdit, std::function<bool(QWidget* ,int, void*)> pluginCallBack, NDD_PROC_DATA* procData);


#ifdef __cplusplus
	}
#endif

std::function<QsciScintilla* (QWidget*)> s_getCurEdit;
std::function<bool (QWidget*,int, void*)> s_invokeMainFun;

bool NDD_PROC_IDENTIFY(NDD_PROC_DATA* pProcData)
{
	if(pProcData == NULL)
	{
		return false;
	}
	pProcData->m_strPlugName = QObject::tr("AStyle Tool");
	pProcData->m_strComment = QObject::tr("AStyle Tool For Ndd");

	pProcData->m_version = QString("v1.0");
	pProcData->m_auther = QString("durongze");

	pProcData->m_menuType = 1;

	return true;
}

int NDD_PROC_MAIN(QWidget* pNotepad, const QString &strFileName, std::function<QsciScintilla*(QWidget*)>getCurEdit, std::function<bool(QWidget*,int, void*)> pluginCallBack,NDD_PROC_DATA* pProcData)
{
	AStyleInstanceObj* pInstance = nullptr;

	if (pProcData != nullptr)
	{
		pInstance = new AStyleInstanceObj(pNotepad, pProcData->m_rootMenu);
	}
	else
	{
		return -1;
	}

	s_getCurEdit = getCurEdit;
	s_invokeMainFun = pluginCallBack;

	pProcData->m_rootMenu->addAction("Pretty Cpp ", pInstance, &AStyleInstanceObj::nddPrettyPrintCppFast);

	return 0;
}

#ifdef WIN32
BOOL WINAPI DllMain(HINSTANCE hInst, DWORD fdwReason, LPVOID lpvReserved) {
	switch (fdwReason) {
	case DLL_PROCESS_ATTACH:
	case DLL_THREAD_ATTACH:
		break;
	case DLL_THREAD_DETACH:
		break;
	case DLL_PROCESS_DETACH:
		break;
	}
	return TRUE;
}
#else
void onDllUnload(void)
{
	Setting::destorySet();
}
#endif
