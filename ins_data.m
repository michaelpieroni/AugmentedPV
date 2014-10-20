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

% %  hM=varargin{1};
% %  a=num2str(get(hM.text_eler,'String'));
% %  set(handles.edit_elec_r,'String',a(1));

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ins_data wait for user response (see UIRESUME)
% uiwait(handles.Con_Panel);

function inizialize_gui(data)
    data.num_elec_r = 0;
    data.num_elec_c = 0;
    data.num_phos_r = 0;
    data.num_phos_c = 0;
    data.dim_elec = 0;
    data.profile = '';
    data.r_space = 0;
    data.r_time = 0;
    data.modul_prot = '';
    data.h = 0;
    data.k = 0;
    data.modul_phos = '';

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
           
% %     With Con_Panel_CloseRequestFcn is destroyed the Insert&Close Button   
% %     Con_Panel_CloseRequestFcn(hObject, eventdata, handles,dati);
 
%       update_gui(dati);
       update_gui(hObject, eventdata, handles);
       
 %TO DO: doesn't switch variables to update_gui in Main.m
 
%        set(handles.text_eler,'String',dati.numel_r);
%        set(handles.text_elec,'String',dati.numel_c);
%        set(handles.text_dim,'String',dati.dim);
%        set(handles.text_disp,'String',dati.disposition);
%        set(handles.text_sp,'String',dati.r_space);
%        set(handles.text_tr,'String',dati.r_time);
%        set(handles.text_phr,'String',dati.numph_r);
%        set(handles.text_phc,'String',dati.numph_c);
%        set(handles.text_h,'String',dati.k);
%        set(handles.text_k,'String',dati.h);
%        set(handles.text_ty,'String',dati.type_map);
%        set(handles.text_mpr,'String',dati.modul_prot);
%        set(handles.text_mph,'String',dati.modul_phos);

%      set(handles.text1A,'String',num2str(10));
     
%      set(handles.Main.uipanel1,'Enable', 'on')
%      set(handles.Main.Import,'Enable', 'on')
    
     
% --- Executes on button press in push_clear.

function push_clear_Callback(hObject, eventdata, handles)
    set(handles.edit_elec_r,'String','');
    set(handles.edit_elec_c,'String','');
    set(handles.edit_phos_r,'String','');
    set(handles.edit_phos_c,'String','');
    set(handles.edit_dim,'String',' ');
    set(handles.edit_space,'String','');
    set(handles.edit_time,'String','');
    set(handles.edit_h,'String',' ');
    set(handles.edit_k,'String',' ');
    
    % TO DO: set popup to empty
    inizialize_gui(handles)


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
%% At the moment: the number phosfene is equal the number electrode 

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
%% At the moment: the number phosfene is equal the number electrode 

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
function varagout=Con_Panel_CloseRequestFcn(hObject, eventdata, handles,varargin)
 
delete(hObject);
