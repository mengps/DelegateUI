#ifndef DELTHEME_H
#define DELTHEME_H

#include <QObject>
#include <QQmlEngine>

#include "delglobal.h"

QT_FORWARD_DECLARE_CLASS(DelThemePrivate)

class DELEGATEUI_EXPORT DelTheme : public QObject
{
    Q_OBJECT
    QML_SINGLETON
    QML_NAMED_ELEMENT(DelTheme)

    Q_PROPERTY(bool isDark READ isDark NOTIFY isDarkChanged CONSTANT)

    DEL_PROPERTY(int, darkMode, setDarkMode);
    DEL_PROPERTY_INIT(bool, animationEnabled, setAnimationEnabled, true);

    DEL_PROPERTY_READONLY(QVariantMap, Primary); /*! 所有 {Index.json} 中的变量 */

    DEL_PROPERTY_READONLY(QVariantMap, DelButton);
    DEL_PROPERTY_READONLY(QVariantMap, DelTourFocus);
    DEL_PROPERTY_READONLY(QVariantMap, DelTourStep);

public:
    enum class DarkMode {
        System,
        Dark,
        Light
    };
    Q_ENUM(DarkMode);

    ~DelTheme();

    static DelTheme *instance();
    static DelTheme *create(QQmlEngine *, QJSEngine *);

    bool isDark() const;

    void registerCustomThemeComponent(QObject *theme, const QString &component, QVariantMap *themeMap, const QString &themePath);

    Q_INVOKABLE void reloadDefaultTheme();

    Q_INVOKABLE void installThemePrimary(const QColor &color);

    Q_INVOKABLE void installIndexTheme(const QString &themePath);
    Q_INVOKABLE void installIndexThemeKV(const QString &key, const QString &value);
    Q_INVOKABLE void installIndexThemeJSON(const QString &json);
    Q_INVOKABLE void installComponentTheme(const QString &componenet, const QString &themePath);
    Q_INVOKABLE void installComponentThemeKV(const QString &componenet, const QString &key, const QString &value);
    Q_INVOKABLE void installComponentThemeJSON(const QString &componenet, const QString &json);

signals:
    void isDarkChanged();

private:
    explicit DelTheme(QObject *parent = nullptr);

    Q_DECLARE_PRIVATE(DelTheme);
    QScopedPointer<DelThemePrivate> d_ptr;
};

#endif // DELTHEME_H