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

% Last Modified by GUIDE v2.5 02-Oct-2014 23:32:21

% Begin initialization code - DO NOT EDIT
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

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ins_data wait for user response (see UIRESUME)
% uiwait(handles.Con_Panel);

function inizialize_gui(handles)
    handles.date.num_elec_r = 0;
    handles.date.num_elec_c = 0;
    handles.date.num_phos_r = 0;
    handles.date.num_phos_c = 0;
    handles.date.dim_elec = 0;
    handles.date.r_space = 0;
    handles.date.r_time = 0;
    handles.date.h = 0;
    handles.date.k = 0;
    handles.date.disposition = '';
    handles.date.modul_prot = '';
    handles.date.modul_phos = '';

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
%      if isempty(edit_dim) || isempty(edit_space) || isempty(edit_num) || isempty(edit_time)|| isempty(pop_mod_prot)|| isempty(pop_mod_phos)|| isempty(pop_dispo)|| isempty(type_map)
%         errordlg('Please, Fill In On Fiel','Error')
%      else
     global num_elec_r num_elec_c dim_elec r_space r_time num_phos_r 
     global num_phos_c h k mod_phos disposition mod_prot type_map
     
     num_elec_r = str2num(get(handles.edit_elec_r,'String'));
     num_elec_c = str2num(get(handles.edit_elec_c,'String'));
     dim_elec = str2num(get(handles.edit_dim,'String'));
     r_space = str2num(get(handles.edit_space,'String'));
     r_time = str2num(get(handles.edit_time,'String'));
     num_phos_r = str2num(get(handles.edit_phos_r,'String'));
     num_phos_c = str2num(get(handles.edit_phos_c,'String'));
     h = str2num(get(handles.edit_h,'String'));
     k = str2num(get(handles.edit_k,'String'));
          
     %select modulation prothesis
     list1 = get(handles.pop_mod_prot,'String');
     m = get(handles.pop_mod_prot,'Value');
     mod_phos = list1(m);
    
     %select disposition
     list2 = get(handles.pop_dispo,'String');
     pr = get(handles.pop_dispo,'Value');
     disposition = list2(pr);
    
     %select modulation phosphene
     list3 = get(handles.pop_mod_phos,'String');
     ph = get(handles.pop_mod_phos,'Value');
     mod_prot = list3(ph);
        
     %select type map
     list4 = get(handles.pop_type,'String');
     ty = get(handles.pop_type,'Value');
     type_map = list4(ty);
     
%      guidata(handles.Main,handles);
%      set(handles.Main.uipanel1,'Enable', 'on')
%      set(handles.Main.Import,'Enable', 'on')
    
     
% --- Executes on button press in push_clear.

function push_clear_Callback(hObject, eventdata, handles)
    set(handles.edit_elec_r,'String','');
    set(handles.edit_elec_c,'String','');
    set(handles.edit_phos_r,'String','');
    set(handles.edit_phos_c,'String','');
    set(handles.edit_dim,'String','');
    set(handles.edit_space,'String','');
    set(handles.edit_time,'String','');
    inizialize_gui()


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


% --- Executes on selection change in pop_dispo.
function pop_dispo_Callback(hObject, eventdata, handles)
    

% --- Executes during object creation, after setting all properties.
function pop_dispo_CreateFcn(hObject, eventdata, handles)

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

% Hints: contents = cellstr(get(hObject,'String')) returns pop_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_type


% --- Executes during object creation, after setting all properties.
function pop_type_CreateFcn(hObject, eventdata, handles)

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_elec_c_Callback(hObject, eventdata, handles)
% 
% Hints: get(hObject,'String') returns contents of edit_elec_c as text
%        str2double(get(hObject,'String')) returns contents of edit_elec_c as a double


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
