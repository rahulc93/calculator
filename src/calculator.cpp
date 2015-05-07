#include "calculator.h"

#include <QApplication>
#include <QDir>
#include <QStandardPaths>
#include <QQuickWidget>
#include <QQmlContext>
#include <QPointer>
#include <QDebug>

#include <KDeclarative/KDeclarative>
#include <KSharedConfig>
#include <KLocalizedString>

Calculator::Calculator()
: QMainWindow()
{
    setObjectName(QLatin1String("Calculator"));

    m_view = new QQuickWidget(this);
    m_view->rootContext()->setContextProperty("calculator", this);

    KDeclarative::KDeclarative kdeclarative;
    kdeclarative.setDeclarativeEngine(m_view->engine());
    kdeclarative.setupBindings();

    setMinimumSize(800, 600);

    m_view->setResizeMode(QQuickWidget::SizeRootObjectToView);

    setCentralWidget(m_view);
}

Calculator::~Calculator()
{
    delete m_view;
    m_view = NULL;
}

QQmlEngine* Calculator::getEngine()
{
    return m_view->engine();
}

void Calculator::show()
{
    QMainWindow::show();
    // add the qml view as the main widget
    QString location = QStandardPaths::locate(QStandardPaths::DataLocation, "qml/main.qml");
    //qDebug() << "location: " << location;
    QUrl url = QUrl::fromLocalFile(location);
    m_view->setSource(url);
    //qDebug() << "url set to " << url;
}