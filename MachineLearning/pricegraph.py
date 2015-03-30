# plot the price of a house against its sq feet.
from os import linesep
import pylab as pl
import matplotlib.ticker as tkr

def format_axes(pl, pl1):
  pl.axis([0,5000,0,700000])
  pl.xlabel('floor space (sq. ft.)')
  pl.ylabel('price ($)')
  pl1.get_yaxis().set_major_formatter(
      tkr.FuncFormatter(lambda x, p: format(int(x), ',')))
  pl1.get_xaxis().set_major_formatter(
      tkr.FuncFormatter(lambda x, p: format(int(x), ',')))
  
def scatter_plot():
  fig = pl.figure(1)
  pl1 = fig.add_subplot(111, title='The Size and Price of Houses Sold')
  format_axes(pl, pl1)
  for line in get_data():
    print line
    pl1.plot(line[0], line[2], 'xr')
  pl.show()

def get_data():
  #get the data
  data = []
  with open('house_price.txt', 'r') as f:
    data = f.read().split(linesep)

  for line in data:
    if line is not '':
      yield line.split(',')

if __name__ == '__main__':
  scatter_plot()

