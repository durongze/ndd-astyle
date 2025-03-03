#pragma once
#include <QObject>
#include <QWidget>

class QMenu;

class AStyleInstanceObj :public QObject
{
public:
	//外面Ndd释放时，会自动释放该对象。
	AStyleInstanceObj(QWidget* pNotepad, QMenu* pMenu);
	~AStyleInstanceObj();

public slots:
	void nddPrettyPrintCppFast();

public:
	QWidget* m_pNotepad;
	QMenu* m_rootMenu;

private:
	AStyleInstanceObj(const AStyleInstanceObj& other) = delete;
	AStyleInstanceObj& operator=(const AStyleInstanceObj& other) = delete;

};