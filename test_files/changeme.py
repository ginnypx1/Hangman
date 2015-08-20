from tkinter import *


class ChangeMe(Frame):
	def __init__(self, parent=None):
		Frame.__init__(self, parent)

		# create text box
		lab = Label(self, text='Change me!', width=20, height=10)
		lab.pack(side=TOP, fill=BOTH)

		# create entry box
		form = Frame(self)
		form.pack(side=TOP)

		var = StringVar()
		ent = Entry(form)
		ent.config(textvariable=var)
		ent.pack(side=LEFT)

		but = Button(form, text='Change text', command=(lambda: self.change(lab, var.get())))
		but.pack(side=RIGHT)

	def change(self, tag, words):
		tag.config(text=words)


if __name__ == '__main__':
	root = Tk()
	root.title('Change Me!')
	cm = ChangeMe(root)
	cm.pack(side=TOP)
	root.mainloop()