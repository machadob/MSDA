import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

def getBr(bo):
    return 0.0043*bo + 266.3158

xy_line = (10000, .004)
y=[0.005, 0.01, 0.023, 0.023, 0.048, 0.06, 0.075, 0.101, 0.104, 0.12, 0.122, 0.2, 0.28, 0.425, 0.48, 0.55, 0.75, 0.785, 0.9, 0.92, 1, 1.04, 1.35, 1.4, 1.41, 1.62, 1.7, 2, 2.5, 3, 3.3, 3.385, 3.5, 3.5, 3.6, 4.05, 4.19, 4.235, 4.288, 6.8, 10, 10.55, 14.83, 27.66, 35, 36.33, 52.16, 55.5, 60, 62, 85, 100, 160, 187.1, 192, 207, 250, 465, 521, 529, 2547, 6654, 9400, 11700, 87000]
x=[0.14, 0.25, 0.3, 0.4, 0.33, 1, 1.2, 4, 2.5, 1, 3, 5, 1.9, 6.4, 15.5, 2.4, 12.3, 3.5, 2.6, 5.7, 6.6, 5.5, 8.1, 12.5, 17.5, 11.4, 6.3, 12.3, 12.1, 25, 25.6, 44.5, 3.9, 10.8, 21, 17, 58, 50.4, 39.2, 179, 115, 179.5, 98.2, 115, 56, 119.5, 440, 175, 81, 1320, 325, 157, 169, 419, 180, 406, 490, 423, 655, 680, 4603, 5712, 70, 50, 154.5]
br0 = getBr(0)
br6000 = getBr(6000)
plt.plot(x, y, 'ro')
#The line is plotted in magenta to actual scale
plt.plot([0,6000], [br0, br6000], 'k-', color='m')
plt.text(2000, 2000,'br = 0.0043*bo + 266.3158', ha='center', va='center')
plt.text(3000, 30000,'Graph with the scale unadjusted', ha='center', va='center')
plt.show()

plt.plot(x, y, 'ro')
#The line is plotted in magenta with the y axis scaled from 0 to 1000.
#As a result some points (including ouliers) will fall outside the visible graph.
plt.plot([0,6000], [br0, br6000], 'k-', color='m')
plt.text(2000, 700,'Graph with the Y axis scaled 0-1000', ha='center', va='center')
plt.text(2000, 650,'Note: Some points are outside range.', ha='center', va='center')

plt.text(2000, 294,'br = 0.0043*bo + 266.3158', ha='center', va='center')
plt.axis([min(x), max(x), 0, 1000])
plt.show()

#The center points for objects.png
objects = [(124.2451457805594, 369.49860036091297), (150.01854478644992, 522.27782167495707), (203.63307084557258, 212.47255814835947), (299.36398422525218, 362.07017191746831), (366.91460967253897, 188.69501834124745)]
im = plt.imread('c:/Temp/objects.png')
implot = plt.imshow(im)
for i in range(0,len(objects)):
    plt.plot(objects[i][0],objects[i][1], 'o')
plt.show()

#Plot the web request intervals.
intervals = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
noOfRequests = [684, 434, 399, 248, 347, 374, 303, 846, 1994, 3096, 3209, 3820, 3827, 4391, 4716, 4284, 4042, 2793, 1820, 1493, 1310, 1015, 1117, 1186]
plt.xlabel("Hour Interval")
plt.ylabel("Number of Requests")
plt.plot(intervals, noOfRequests)
plt.show()