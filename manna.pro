TEMPLATE = app
CONFIG += console
QT += core

#RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
#QML_IMPORT_PATH =

# Default rules for deployment.
#include(deployment.pri)

OTHER_FILES +=

SOURCES += main.cpp \
    src/library.cpp \
    src/module.cpp \
    src/module_bible.cpp \
    src/api.cpp \
    src/manna.cpp

HEADERS += \
    src/library.h \
    src/module.h \
    src/module_bible.h \
    src/api.h \
    src/manna.h

unix {
    target.path = /usr/lib
    INSTALLS += target

    INCLUDEPATH += \
        /usr/local/include/sword \
        /usr/include/sword \
        "$$PWD/libs/manna-server/src"

    QMAKE_LIBDIR += /usr/local/lib

    LIBS += \
        -lsword \
        -lmanna-server

    CONFIG(debug, debug|release) {
        QMAKE_LIBDIR += "$$PWD/libs/manna-server/build/Debug"
    }
    else {
        QMAKE_LIBDIR += "$$PWD/libs/manna-server/build/Release"
    }
}

RESOURCES += \
    resources.qrc