import tkinter


window = tkinter.Tk()
window.title('ケームブパイソン')
window.geometry('860x420+100+100')
window.resizable(False,False)

sgh = tkinter.Button(window,text='ソンギョンフン',width=15)
sgh.place(x=100, y=30)

window.mainloop()

