#ifndef DELSIZEGENERATOR_H
#define DELSIZEGENERATOR_H

#include <QObject>
#include <QQmlEngine>

class DelSizeGenerator : public QObject
{
    Q_OBJECT
    QML_NAMED_ELEMENT(DelSizeGenerator)

public:
    DelSizeGenerator(QObject *parent = nullptr);
    ~DelSizeGenerator();

    Q_INVOKABLE static QList<qreal> generateFontSize(qreal fontSizeBase);
    Q_INVOKABLE static QList<qreal> generateFontLineHeight(qreal fontSizeBase);
};

#endif // DELSIZEGENERATOR_H