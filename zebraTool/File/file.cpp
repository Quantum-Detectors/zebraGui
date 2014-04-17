#include "file.h"

File::File(QQuickItem *parent):
    QQuickItem(parent)
{
    // By default, QQuickItem does not draw anything. If you subclass
    // QQuickItem to create a visual item, you will need to uncomment the
    // following line and re-implement updatePaintNode()
    
    // setFlag(ItemHasContents, true);
}

File::~File()
{
}

void File::openFile(QString filename, QString mode)
{
    if (filePointer != NULL)
        fclose(filePointer);
    filePointer = fopen(filename.toLocal8Bit().data(),
                        mode.toLocal8Bit().data());
}

void File::writeFile(QString data)
{
    if (filePointer == NULL) {
        return;
    }
    fprintf(filePointer, "%s", data.toLocal8Bit().data());
}

void File::closeFile()
{
    if (filePointer != NULL)
        fclose(filePointer);
}
