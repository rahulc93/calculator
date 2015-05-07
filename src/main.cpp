#include "version.h"
#include "calculator.h"

#include <KAboutData>
#include <Kdelibs4ConfigMigrator>
#include <KLocalizedString>

#include <QApplication>
#include <QFontDatabase>
#include <QFontInfo>
#include <QStandardPaths>
#include <QQmlEngine>

static const char description[] =
I18N_NOOP("Basic Calculator");

int main(int argc, char **argv)
{
    QApplication app(argc, argv);

    QStringList configFiles;
    configFiles << QLatin1String("calculatorrc");
    Kdelibs4ConfigMigrator migrator(QLatin1String("calculator"));
    migrator.setConfigFiles(configFiles);
    migrator.migrate();

    KLocalizedString::setApplicationDomain("calculator");
    QApplication::setApplicationName("calculator");
    QApplication::setApplicationVersion(KHM_VERSION);
    QApplication::setOrganizationDomain("kde.org");
    QApplication::setApplicationDisplayName(i18n("calculator"));

    app.connect(&app, SIGNAL(lastWindowClosed()), &app, SLOT(quit()));

    KAboutData aboutData(I18N_NOOP("calculator"),
                         i18n("Calculator"),
                         I18N_NOOP(KHM_VERSION),
                         i18n(description),
                         KAboutLicense::GPL,
                         i18n("(c) 2015-2025, Rahul Chowdhury"));
    aboutData.addAuthor(i18n("Rahul Chowdhury"), i18n("Developer"),
                        "rahul.chowdhury@kdemail.net", "http://rahulc93.wordpress.com/", "rahulch");

    KAboutData::setApplicationData(aboutData);

    QFont f("Domestic Manners", 12, QFont::Normal, true);
    if (!QFontInfo(f).exactMatch())
    {
        QFontDatabase::addApplicationFont(QStandardPaths::locate(QStandardPaths::DataLocation, "fonts/Domestic_Manners.ttf"));
    }

    QFont fd("Dustismo Roman", 12, QFont::Normal, true);
    if (!QFontInfo(fd).exactMatch())
    {
        QFontDatabase::addApplicationFont(QStandardPaths::locate(QStandardPaths::DataLocation, "fonts/Dustismo_Roman.ttf"));
    }

    Calculator calculator;
    QObject::connect(calculator.getEngine(), SIGNAL(quit()), &app, SLOT(quit()));
    calculator.show();
    return app.exec();
}

// kate: space-indent on; tab-width 4; indent-width 4; mixed-indent off; replace-tabs on;
// vim: set et sw=4 ts=4 cino=l1,cs,U1:
