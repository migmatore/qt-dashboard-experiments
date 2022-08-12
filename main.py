import sys
import random
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot, pyqtProperty, QUrl, QTimer, QDateTime
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
import PyQt5.QtQml
import PyQt5.QtCore
import PyQt5.QtWidgets
#from PyQt5.QtChart import QChart

temp_list = []
cur_temp = 0

class Foo(QObject):
    textChanged = pyqtSignal()

    def __init__(self, parent=None):
        QObject.__init__(self, parent)
        self._text = ""

    @pyqtProperty(str, notify=textChanged)
    def text(self):
        return self._text

    @text.setter
    def text(self, value):
        if self._text == value:
            return
        self._text = value
        self.textChanged.emit()

    @pyqtSlot(QObject)
    def update(self, series):
        series.clear()
        for i in range(60):
        #     #f = open('/sys/bus/iio/devices/iio:device1/in_temp_input', 'r')
        #     # series.append(i, int(f.readline()) / 1000)
        #     series.append(i, temp_list[i])
            series.append(i, cur_temp)

def update_value():
    # f = open('/sys/bus/iio/devices/iio:device1/in_temp_input', 'r')
    
    # temp = int(f.readline()) / 1000

    # obj.text = "Current temp {}°C".format(temp)
    cur_temp = temp
    #obj.text = ""
    # if len(temp_list) >= 60:
    #     temp_list.pop(0)
    # else:
    #     temp_list.append(temp)
#    print(*temp_list)

if __name__ == "__main__":
    app = PyQt5.QtWidgets.QApplication(sys.argv)
    #chart = QChart()
    obj = Foo()

    timer = QTimer()
    timer.timeout.connect(update_value)
    timer.start(5000)

    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("obj", obj)
    engine.load(QUrl("main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec_())
