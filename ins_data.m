function varargout = ins_data(varargin)
% INS_DATA M-file for ins_data.fig
%      INS_DATA, by itself, creates a new INS_DATA or raises the existing
%      singleton*.
%
%      H = INS_DATA returns the handle to a new INS_DATA or the handle to
%      the existing singleton*.
%
%      INS_DATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INS_DATA.M with the given input arguments.
%
%      INS_DATA('Property','Value',...) creates a new INS_DATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ins_data_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ins_data_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ins_data

% Last Modified by GUIDE v2.5 18-Oct-2014 09:21:16

% Begin initialization code - DO NOT EDIT

varargout{1}=1;
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ins_data_OpeningFcn, ...
                   'gui_OutputFcn',  @ins_data_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end


if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
%Initialize Edits and Popup menus


% End initialization code - DO NOT EDIT


% --- Executes just before ins_data is made visible.
function ins_data_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ins_data (see VARARGIN)

% Choose default command line output for ins_data
handles.output = hObject;
% Assign initial value at EDITs and POPUP menus

% % Problem with these 3 lines

cont_textMain = varargin{1};
inizialize_edit(cont_textMain,handles)

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ins_data wait for user response (see UIRESUME)
% uiwait(handles.Con_Panel);

function inizialize_edit(ctM,handles)
%% Set Edit with the value of the Text(Main.m)
%Num Row of Electrode
r = num2str(get(ctM.text_eler,'String'));
set(handles.edit_elec_r,'String',r(1));

%Num Column of Electrode
c = num2str(get(ctM.text_elec,'String'));
set(handles.edit_elec_c,'String',c(1));

%Dimension Electrode
d = num2str(get(ctM.text_dim,'String'));
set(handles.edit_dim,'String',d(1));

%Space Response
sp = num2str(get(ctM.text_sp,'String'));
set(handles.edit_space,'String',sp(1));

%Time Response
ti = num2str(get(ctM.text_tr,'String'));
set(handles.edit_time,'String',ti(1));

%Num row of Phosfenes
pr = num2str(get(ctM.text_phr,'String'));
set(handles.edit_phos_r,'String',pr(1));

%Num Column of Phosfenes
pc = num2str(get(ctM.text_phc,'String'));
set(handles.edit_phos_c,'String',pc(1));

%H e K: parameters used to convert the pixels in mm of electrodes
h = num2str(get(ctM.text_h,'String'));
set(handles.edit_h,'String',h(1));
k = num2str(get(ctM.text_k,'String'));
set(handles.edit_k,'String',k(1));

%Type Map
ty = get(ctM.text_ty,'String');
switch (ty)
    case {' '}
        set(handles.pop_type,'Value',1);
    case {'Uniform'}
        set(handles.pop_type,'Value',2);
    case {'Not Uniform'}
        set(handles.pop_type,'Value',3);
end

%Modulation Prothesis
mpr = get(ctM.text_mpr,'String');
switch (mpr)
    case {' '}
        set(handles.pop_mod_prot,'Value',1);
    case {'Voltage'}
        set(handles.pop_mod_prot,'Value',2);
    case {'Current'}
        set(handles.pop_mod_prot,'Value',3);
end

%Modulation Phosfenes
mp = get(ctM.text_mph,'String');
switch (mp)
    case {' '}
        set(handles.pop_mod_phos,'Value',1);
    case {'Amplitude'}
        set(handles.pop_mod_phos,'Value',2);
    case {'Intensity'}
        set(handles.pop_mod_phos,'Value',3);
    case {'& Amplitude-Intensity'}
        set(handles.pop_mod_phos,'Value',4);
end

%Profile of Electrodes
p = get(ctM.text_profile,'String');
switch (p)
    case {' '}
        set(handles.pop_profile,'Value',1);
    case {'Square'}
        set(handles.pop_profile,'Value',2);
    case {'Circle'}
        set(handles.pop_profile,'Value',3);
end        
            
        

% --- Outputs from this function are returned to the command line.
function varargout = ins_data_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in push_insert.
function push_insert_Callback(hObject, eventdata, handles)
%      if isempty(edit_dim) || isempty(edit_space) || isempty(edit_num) || isempty(edit_time)|| isempty(pop_mod_prot)|| isempty(pop_mod_phos)|| isempty(pop_profile)|| isempty(type_map)
%         errordlg('Please, Fill In On Fiel','Error')
%      else
    
      handles.data.numel_r = str2num(get(handles.edit_elec_r,'String'));
      handles.data.numel_c = str2num(get(handles.edit_elec_c,'String')); 
      handles.data.dim = str2num(get(handles.edit_dim,'String'));
      handles.data.r_space = str2num(get(handles.edit_space,'String'));
      handles.data.r_time = str2num(get(handles.edit_time,'String'));
      handles.data.numph_r = str2num(get(handles.edit_phos_r,'String'));
      handles.data.numph_c = str2num(get(handles.edit_phos_c,'String'));
      handles.data.h = str2num(get(handles.edit_h,'String'));
      handles.data.k = str2num(get(handles.edit_k,'String'));
      
      %select modulation prothesis
      list1 = get(handles.pop_mod_prot,'String');
      m = get(handles.pop_mod_prot,'Value');
      handles.data.mod_phos = list1(m);

      %select disposition
      list2 = get(handles.pop_profile,'String');
      pr = get(handles.pop_profile,'Value');
      handles.data.profile = list2(pr);
    
      %select modulation phosphene
      list3 = get(handles.pop_mod_phos,'String');
      ph = get(handles.pop_mod_phos,'Value');
      handles.data.mod_prot = list3(ph);
        
      %select type map
      list4 = get(handles.pop_type,'String');
      ty = get(handles.pop_type,'Value');
      handles.data.type_map = list4(ty);
      
      
      guidata(hObject,handles.data)
      salva(handles);
      close;
%       Main();
     

    
function salva(handles)
    %% Save data to file 
    FileData = table([handles.data.numel_r;...
                       handles.data.numel_c;...
                       handles.data.r_space;...
                       handles.data.dim;...
                       handles.data.r_time;...
                       handles.data.numph_r;...
                       handles.data.numph_c;... 
                       handles.data.h;...
                       handles.data.k;
                       handles.data.mod_phos;...
                       handles.data.type_map;... 
                       handles.data.mod_prot;...
                       handles.data.profile]);
     cd();
     writetable(FileData,'data.txt');
  
%      uisave({'handles.data'},'data');
%      [file,path] = uiputfile('data.txt','Save file name');
%      if file==0
%         return
%      end
%      pathfile=joinseq(path,file);
%      dlmwrite(pathfile, FileData);
     
      
function push_clear_Callback(hObject, eventdata, handles)
%%  Clear edit and pop menu
    set(handles.edit_elec_r,'String','');
    set(handles.edit_elec_c,'String','');
    set(handles.edit_phos_r,'String','');
    set(handles.edit_phos_c,'String','');
    set(handles.edit_dim,'String',' ');
    set(handles.edit_space,'String','');
    set(handles.edit_time,'String','');
    set(handles.edit_h,'String',' ');
    set(handles.edit_k,'String',' ');
    set(handles.pop_profile,'Value',1);
    set(handles.pop_type,'Value',1);
    set(handles.pop_mod_phos,'Value',1);
    set(handles.pop_mod_prot,'Value',1);
    


function edit_type_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_type_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pop_mod_phos.
function pop_mod_phos_Callback(hObject, eventdata, handles)
  

% --- Executes during object creation, after setting all properties.
function pop_mod_phos_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_elec_r_Callback(hObject, eventdata, handles)
%%  At the moment: the number phosfene is equal the number electrode 
    a = get(handles.edit_elec_r,'String');
    set(handles.edit_phos_r,'String',a);


% --- Executes during object creation, after setting all properties.
function edit_elec_r_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_dim_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_dim_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_space_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_space_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_time_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_time_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pop_profile.
function pop_profile_Callback(hObject, eventdata, handles)
    

% --- Executes during object creation, after setting all properties.
function pop_profile_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pop_mod_prot.
function pop_mod_prot_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function pop_mod_prot_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pop_type.
function pop_type_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function pop_type_CreateFcn(hObject, eventdata, handles)

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_elec_c_Callback(hObject, eventdata, handles)
%%  At the moment: the number phosfene is equal the number electrode 
    a = get(handles.edit_elec_c,'String');
    set(handles.edit_phos_c,'String',a);


% --- Executes during object creation, after setting all properties.
function edit_elec_c_CreateFcn(hObject, eventdata, handles)
%
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_phos_r_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_phos_r_CreateFcn(hObject, eventdata, handles)
% 
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_phos_c_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_phos_c_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_h_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_h_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_k_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_k_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close Con_Panel.
function varagout = Con_Panel_CloseRequestFcn(hObject, eventdata, handles,varargin)
 
delete(hObject);
