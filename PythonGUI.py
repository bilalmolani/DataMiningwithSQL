#!/usr/bin/env python
# coding: utf-8

# In[4]:


import sys
get_ipython().system(u'{sys.executable} -m pip install mysql-connector-python')


# In[1]:


def validation(): # Function which call VALIDATION PROC
    
    mySQL_conn = mysql.connector.connect(host='localhost',
                                   database='yelp_db',
                                   user='root',
                                   password='saud123')
    
   
    cursor = mySQL_conn.cursor()
    uid = userid.get()
    bind = bid.get()
    
    
    
    cursor.callproc('DecisionTree_train')
    cursor.callproc('RunBeforeValidation')
    cursor.callproc('VALIDATION')
    for result in cursor.stored_results():
        print(" ")
        a=list(result.fetchall()[0])
        print(a[0])
    
    
    Label1 = Label(top)
    Label1.place(relx=0.60, rely=0.70, height=21, width=55)
    Label1.configure(activebackground="#f9f9f9")
    Label1.configure(activeforeground="black")
    Label1.configure(background="#d9d9d9")
    Label1.configure(disabledforeground="#a3a3a3")
    Label1.configure(foreground="#000000")
    Label1.configure(highlightbackground="#d9d9d9")
    Label1.configure(highlightcolor="black")
    Label1.configure(text=str(a[0])+'%')
    
    
    
   
def train_test(): #Function which call Decision Tree Training PROC
    
    mySQL_conn = mysql.connector.connect(host='localhost',
                                   database='yelp_db',
                                   user='root',
                                   password='pentagonnew11')
    cursor = mySQL_conn.cursor()
    ssd = sd.get()
    eed = ed.get()
    
    
   
    cursor.callproc('create_train_tbl',[ssd,eed])
    
    cursor.callproc('create_test_tbl')
    
def data_clean(): #Function which call Data_cleaning PROC
    
    mySQL_conn = mysql.connector.connect(host='localhost',
                                   database='yelp_db',
                                   user='root',
                                   password='pentagonnew11')
    cursor = mySQL_conn.cursor()
    
    cursor.callproc('data_cleaning')
    
def rollback(): #Function which call Data_cleaning_rollback PROC
    
    mySQL_conn = mysql.connector.connect(host='localhost',
                                   database='yelp_db',
                                   user='root',
                                   password='pentagonnew11')
    cursor = mySQL_conn.cursor()
    
    cursor.callproc('data_cleaning_rollback')
    
    
    
    
def expected_rating(): # Function which call Decision Tree Result PROC
    mySQL_conn = mysql.connector.connect(host='localhost',
                                   database='yelp_db',
                                   user='root',
                                   password='pentagonnew11')
    cursor = mySQL_conn.cursor()
    uid = userid.get()
    biid = bid.get()
    
    cursor.callproc('DecisionTreeResult',[uid,biid])
    for result in cursor.stored_results():
        print(" ")
        a=list(result.fetchall()[0])
        print(a[0])
    Label1 = Label(top)
    Label1.place(relx=0.60, rely=0.76, height=21, width=55)
    Label1.configure(activebackground="#f9f9f9")
    Label1.configure(activeforeground="black")
    Label1.configure(background="#d9d9d9")
    Label1.configure(disabledforeground="#a3a3a3")
    Label1.configure(foreground="#000000")
    Label1.configure(highlightbackground="#d9d9d9")
    Label1.configure(highlightcolor="black")
    Label1.configure(text=a[0])
    
def naive_rating(): # Function which call Naive Result PROC
    mySQL_conn = mysql.connector.connect(host='localhost',
                                   database='yelp_db',
                                   user='root',
                                   password='pentagonnew11')
    cursor = mySQL_conn.cursor()
    uid = userid.get()
    biid = bid.get()
    cursor.callproc('NaiveBayesResult',[uid,biid])
    for result in cursor.stored_results():
        print(" ")
        a=list(result.fetchall()[0])
        print(a[0])   
    Label2 = Label(top)
    Label2.place(relx=0.60, rely=0.85, height=21, width=55)
    Label2.configure(activebackground="#f9f9f9")
    Label2.configure(activeforeground="black")
    Label2.configure(background="#d9d9d9")
    Label2.configure(disabledforeground="#a3a3a3")
    Label2.configure(foreground="#000000")
    Label2.configure(highlightbackground="#d9d9d9")
    Label2.configure(highlightcolor="black")
    Label2.configure(text=a[0])
    
    
    
    
    


# In[2]:


import sys
import mysql.connector
import Tkinter as tk
from Tkinter import *



top = tk.Tk()

top.geometry("600x450+408+139")
top.title("Database System ECE656")
top.configure(borderwidth="20")
top.configure(relief="ridge")
top.configure(background="#d9d9d9")
top.configure(highlightbackground="#d9d9d9")
top.configure(highlightcolor="black")
top.configure(takefocus="23")
top.configure(width="10")

Labelframe1 = LabelFrame(top)
Labelframe1.place(relx=0.01, rely=0.11, relheight=0.81, relwidth=0.8)
Labelframe1.configure(relief=GROOVE)
Labelframe1.configure(foreground="black")
Labelframe1.configure(text='''RECOMMENDATION SYSTEM''')
Labelframe1.configure(background="#d9d9d9")
Labelframe1.configure(width=490)


Label1 = Label(top)
Label1.place(relx=0.22, rely=0.17, height=21, width=55)
Label1.configure(activebackground="#f9f9f9")
Label1.configure(activeforeground="black")
Label1.configure(background="#d9d9d9")
Label1.configure(disabledforeground="#a3a3a3")
Label1.configure(foreground="#000000")
Label1.configure(highlightbackground="#d9d9d9")
Label1.configure(highlightcolor="black")
Label1.configure(text='''USER ID''')

Label2 = Label(top)
Label2.place(relx=0.22, rely=0.27, height=21, width=68)
Label2.configure(activebackground="#f9f9f9")
Label2.configure(activeforeground="black")
Label2.configure(background="#d9d9d9")
Label2.configure(disabledforeground="#a3a3a3")
Label2.configure(foreground="#000000")
Label2.configure(highlightbackground="#d9d9d9")
Label2.configure(highlightcolor="black")
Label2.configure(text='''BUSINESS ID''')

Label3 = Label(top)
Label3.place(relx=0.22, rely=0.40, height=21, width=68)
Label3.configure(activebackground="#f9f9f9")
Label3.configure(activeforeground="black")
Label3.configure(background="#d9d9d9")
Label3.configure(disabledforeground="#a3a3a3")
Label3.configure(foreground="#000000")
Label3.configure(highlightbackground="#d9d9d9")
Label3.configure(highlightcolor="black")
Label3.configure(text='''Start Date:''')

Label33 = Label(top)
Label33.place(relx=0.22, rely=0.44, height=17, width=77)
Label33.configure(activebackground="#f9f9f9")
Label33.configure(activeforeground="black")
Label33.configure(background="#d9d9d9")
Label33.configure(disabledforeground="#a3a3a3")
Label33.configure(foreground="#000000")
Label33.configure(highlightbackground="#d9d9d9")
Label33.configure(highlightcolor="black")
Label33.configure(text='''(yyyy-mm-dd)''')

Label3 = Label(top)
Label3.place(relx=0.22, rely=0.48, height=21, width=68)
Label3.configure(activebackground="#f9f9f9")
Label3.configure(activeforeground="black")
Label3.configure(background="#d9d9d9")
Label3.configure(disabledforeground="#a3a3a3")
Label3.configure(foreground="#000000")
Label3.configure(highlightbackground="#d9d9d9")
Label3.configure(highlightcolor="black")
Label3.configure(text='''End Date:''')

userid = Entry(top)
userid.place(relx=0.38, rely=0.17,height=20, relwidth=0.29)
userid.configure(background="white")
userid.configure(disabledforeground="#a3a3a3")
userid.configure(font="TkFixedFont")
userid.configure(foreground="#000000")
userid.configure(highlightbackground="#d9d9d9")
userid.configure(highlightcolor="black")
userid.configure(insertbackground="black")
userid.configure(selectbackground="#c4c4c4")
userid.configure(selectforeground="black")

bid = Entry(top)
bid.place(relx=0.38, rely=0.27,height=20, relwidth=0.29)
bid.configure(background="white")
bid.configure(disabledforeground="#a3a3a3")
bid.configure(font="TkFixedFont")
bid.configure(foreground="#000000")
bid.configure(highlightbackground="#d9d9d9")
bid.configure(highlightcolor="black")
bid.configure(insertbackground="black")
bid.configure(selectbackground="#c4c4c4")
bid.configure(selectforeground="black")

sd = Entry(top)
sd.place(relx=0.38, rely=0.40,height=20, relwidth=0.29)
sd.configure(background="white")
sd.configure(disabledforeground="#a3a3a3")
sd.configure(font="TkFixedFont")
sd.configure(foreground="#000000")
sd.configure(highlightbackground="#d9d9d9")
sd.configure(highlightcolor="black")
sd.configure(insertbackground="black")
sd.configure(selectbackground="#c4c4c4")
sd.configure(selectforeground="black")

ed = Entry(top)
ed.place(relx=0.38, rely=0.48,height=20, relwidth=0.29)
ed.configure(background="white")
ed.configure(disabledforeground="#a3a3a3")
ed.configure(font="TkFixedFont")
ed.configure(foreground="#000000")
ed.configure(highlightbackground="#d9d9d9")
ed.configure(highlightcolor="black")
ed.configure(insertbackground="black")
ed.configure(selectbackground="#c4c4c4")
ed.configure(selectforeground="black")



Button1 = Button(top)
Button1.place(relx=0.15, rely=0.56, height=24, width=106)
Button1.configure(activebackground="#d9d9d9")
Button1.configure(activeforeground="#000000")
Button1.configure(background="#d9d9d9")
Button1.configure(disabledforeground="#a3a3a3")
Button1.configure(foreground="#000000")
Button1.configure(highlightbackground="#d9d9d9")
Button1.configure(highlightcolor="black")
Button1.configure(pady="0")
Button1.configure(text='''Data Cleaning''')
Button1.configure(width=187)
Button1.configure(command=lambda: data_clean())




Button2 = Button(top)
Button2.place(relx=0.58, rely=0.56, height=24, width=116)
Button2.configure(activebackground="#d9d9d9")
Button2.configure(activeforeground="#000000")
Button2.configure(background="#d9d9d9")
Button2.configure(disabledforeground="#a3a3a3")
Button2.configure(foreground="#000000")
Button2.configure(highlightbackground="#d9d9d9")
Button2.configure(highlightcolor="black")
Button2.configure(pady="0")
Button2.configure(text='''Generate Train Table''')
Button2.configure(width=190)
Button2.configure(command=lambda: train_test())


Button3 = Button(top)
Button3.place(relx=0.15, rely=0.63, height=24, width=106)
Button3.configure(activebackground="#d9d9d9")
Button3.configure(activeforeground="#000000")
Button3.configure(background="#d9d9d9")
Button3.configure(disabledforeground="#a3a3a3")
Button3.configure(foreground="#000000")
Button3.configure(highlightbackground="#d9d9d9")
Button3.configure(highlightcolor="black")
Button3.configure(pady="0")
Button3.configure(text='''Roll Back''')
Button3.configure(width=187)
Button3.configure(command=lambda: rollback())



Button4 = Button(top)
Button4.place(relx=0.58, rely=0.63, height=24, width=116)
Button4.configure(activebackground="#d9d9d9")
Button4.configure(activeforeground="#000000")
Button4.configure(background="#d9d9d9")
Button4.configure(disabledforeground="#a3a3a3")
Button4.configure(foreground="#000000")
Button4.configure(highlightbackground="#d9d9d9")
Button4.configure(highlightcolor="black")
Button4.configure(pady="0")
Button4.configure(text='''Exit''')
Button4.configure(width=187)


Buttonr = Button(top)
Buttonr.place(relx=0.15, rely=0.78, height=24, width=200)
Buttonr.configure(activebackground="#d9d9d9")
Buttonr.configure(activeforeground="#000000")
Buttonr.configure(background="#d9d9d9")
Buttonr.configure(disabledforeground="#a3a3a3")
Buttonr.configure(foreground="#000000")
Buttonr.configure(highlightbackground="#d9d9d9")
Buttonr.configure(highlightcolor="black")
Buttonr.configure(pady="0")
Buttonr.configure(text='''Expected Rating-DecisionTree''')
Buttonr.configure(width=187)
Buttonr.configure(command=lambda: expected_rating())


Buttonn = Button(top)
Buttonn.place(relx=0.15, rely=0.85, height=24, width=200)
Buttonn.configure(activebackground="#d9d9d9")
Buttonn.configure(activeforeground="#000000")
Buttonn.configure(background="#d9d9d9")
Buttonn.configure(disabledforeground="#a3a3a3")
Buttonn.configure(foreground="#000000")
Buttonn.configure(highlightbackground="#d9d9d9")
Buttonn.configure(highlightcolor="black")
Buttonn.configure(pady="0")
Buttonn.configure(text='''Naive Validator Rating''')
Buttonn.configure(width=187)
Buttonn.configure(command=lambda: naive_rating())



Button = Button(top)
Button.place(relx=0.15, rely=0.71, height=24, width=200)
Button.configure(activebackground="#d9d9d9")
Button.configure(activeforeground="#000000")
Button.configure(background="#d9d9d9")
Button.configure(disabledforeground="#a3a3a3")
Button.configure(foreground="#000000")
Button.configure(highlightbackground="#d9d9d9")
Button.configure(highlightcolor="black")
Button.configure(pady="0")
Button.configure(text='''Training and Validation''')
Button.configure(width=187)
Button.configure(command=lambda: validation())



top.mainloop()


# In[53]:


---1lKK3aKOuomHnwAkAow


# In[ ]:





# In[ ]:




