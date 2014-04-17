#ifndef FILE_H
#define FILE_H

#include <QQuickItem>

class File : public QQuickItem
{
    Q_OBJECT
    Q_DISABLE_COPY(File)
    
public:
    File(QQuickItem *parent = 0);
    ~File();
    Q_INVOKABLE void openFile(QString fileName, QString mode);
    Q_INVOKABLE void writeFile(QString data);
    Q_INVOKABLE void closeFile();

private:
    FILE *filePointer;
};

#endif // FILE_H

