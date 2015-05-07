#ifndef _CALCULATOR_H_
#define _CALCULATOR_H_

#include <KSharedConfig>

#include <QMainWindow>

class QQmlEngine;
class QQuickWidget;
class KHelpMenu;

class Calculator : public QMainWindow {
    Q_OBJECT

public:

    /**
     * Default Constructor
     */
    Calculator();

    /**
     * Default Destructor
     */
    virtual ~Calculator();

    void show();

    // get m_view->engine()
    QQmlEngine* getEngine();

private:

    QQuickWidget   *m_view;
};

#endif // _KHANGMAN_H_