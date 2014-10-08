%all'interno di ().callback

%assegnare il valore di una edit ad una variabile
n = str2num(get(handles.nome_edit,'string'));

%settare il valore di una static text
set(handles.nome_static,'string',variabile_da_visualizzare)

%mandare in esecuzione il grafico da button_callback
axes(handles.axes1)

%per inserire le stringhe nella popupmenu bisogna andare su string e
%cliccare sul pulsantino

%per far funzionare i pulsanti della popup menu
val=get(hObject,'value');
str=get(hObject,'value');  %recupera il valore e lo assegna alla variabile
switch str{val}
    case 'mio'
        handles.current_data=handles.mio; % Imposta il valore corrente dei dati
    case 'tuo'
        handles.current_data=handles.tuo;
end

%visualizza su axes
contorno (handles.current_data);

%visualizza immagine caricata
axes(handles.axes1);
x=imread('hhjhk.jpg');
imshow(x)


%BASE
variabile = get(oggetto,'proprietà')
set(oggetto,'propietà', valore propr)
%per le proprietà controlalre su uncontrol propieties

%edit, push button, static text

%sul bottono andare su ()_callback per inserire operazione che si avviano
%una volta che ci si clicca
testo=get(hendles.edit1,'string');
set(handles.text1,'string',testo);
set(hObject,'Proprietà', valore prop);

%POPUP MENU
%inserire i valori nel popup menu poi vai su callback popupmenu
contenuto=get(hObject,'string');
a=get(hObject,'Value');
texto_contenuto = contenuto(a);
set(handles.text1,'string',texto_contenuto);

%LISTBOX
%inserire i valori nel popup menu poi vai su callback popupmenu
contenuto=get(hObject,'string');
a=get(hObject,'Value');
texto_contenuto = contenuto(a);
set(handles.text1,'string',texto_contenuto);

%oppure
contenuto = get(hObject,'String');
a=get(hObject,'Value');
str_selezionata = contenuto(a);
switch cell2mat(str_selezionata)
    case '1'
        ...
    case '2'
        ...
end       

%RADIO BUTTON
%creare una button grup con le radiobutton dentro
%cliccare sul gruppo e mettere SelectionChangeFcn
A=get(hObject,'string');
switch A
    case '1'
        bo
    case '2'
        bo
end

%CHECKBOX 
valore=get(hObject,'Value');
if valore == 1
    (esegui istruzione)
else (esegui un'altra)
    
%Nascondere un oggetto
%andare su open fcn della form
set(handles.axes1,'visible','off');

%verificare se le edit sono piene
n1= str2double(get(handles.edit1,'String'));
n2= str2double(get(handles.edit2,'string'));
if isempty(n1) || isempty(n2)
    msgbox('Riempire tutti i campi','Titolo')
    warndlg('Riempire tutti i campi','Titolo')
    errordlg('Riempire tutti i campi','Titolo')
    helpdlg('Riempire tutti i campi','Titolo');
else
    ...
    
%Menu
%vai callback dello specifico pulsante
winopen('filetesto.txt'); %apre file testo presente nella cartella
    
    