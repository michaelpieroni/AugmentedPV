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

% Last Modified by GUIDE v2.5 25-Nov-2014 11:27:19

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
    cont_textMain = varargin{1};
    inizialize_edit(hObject, eventdata, handles,cont_textMain)
    
% Update handles structure
    guidata(hObject, handles);

% UIWAIT makes ins_data wait for user response (see UIRESUME)
% uiwait(handles.Con_Panel);

function inizialize_edit(hObject, eventdata, handles,ctM)
%% Set Edit with the value of the Text(Main.m)

%Num Row of Electrode
    r = num2str(get(ctM.text_eler,'String'));
    set(handles.edit_elec_r,'String',r);

%Num Column of Electrode
    c = num2str(get(ctM.text_elec,'String'));
    set(handles.edit_elec_c,'String',c);

%Distance of electrode
    d = num2str(get(ctM.text_distance,'String'));
    set(handles.edit_distance,'String',d);

%Space Response
    sp = num2str(get(ctM.text_sp,'String'));
    set(handles.edit_space,'String',sp);

%Time Response
    ti = num2str(get(ctM.text_tr,'String'));
    set(handles.edit_time,'String',ti);
    
%Num row of Phosfenes
    pr = num2str(get(ctM.text_phr,'String'));
    set(handles.edit_phos_r,'String',pr);

%Num Column of Phosfenes
    pc = num2str(get(ctM.text_phc,'String'));
    set(handles.edit_phos_c,'String',pc);

%H e K: parameters used to convert the pixels in mm of electrodes
    RCol = num2str(get(ctM.text_RendCol,'String'));
    set(handles.edit_RendCol,'String',RCol);
    RRow = num2str(get(ctM.text_RendRow,'String'));
    set(handles.edit_RendRow,'String',RRow);

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
    mph = get(ctM.text_mph,'String');
    switch (mph)
        case {' '}
            set(handles.pop_mod_phos,'Value',1);
        case {'Amplitude'}
            set(handles.pop_mod_phos,'Value',2);
        case {'Intensity'}
            set(handles.pop_mod_phos,'Value',3);
        case {'Amplitude & Intensity'}
            set(handles.pop_mod_phos,'Value',4);
    end

%Profile of Electrodes
    prof = get(ctM.text_profile,'String');
    switch (prof)
        case {' '}
            set(handles.pop_profile,'Value',1);
        case {'Square'}
            set(handles.pop_profile,'Value',2);
        case {'Circle'}
            set(handles.pop_profile,'Value',3);
    end     
    
%Type Rendering
    tyrend = get(ctM.text_tyrender,'String');
    switch (tyrend)
        case {' '}
            set(handles.pop_tyrender,'Value',1);
        case {'Default'}
            set(handles.pop_tyrender,'Value',2);
        case {'Design Not Uniform'}
            set(handles.pop_tyrender,'Value',3);
    end
    
guidata(hObject,handles);
            
        

% --- Outputs from this function are returned to the command line.
function varargout = ins_data_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
guidata(hObject,handles);
varargout{1} = handles.output;


% --- Executes on button press in push_insert.
function push_insert_Callback(hObject, eventdata, handles)

%      if ~isempty(handles.edit_distance) || ~isempty(handles.edit_space) ||...
%         ~isempty(handles.edit_elec_r) || ~isempty(handles.edit_elec_c)||...
%         ~isempty(handles.edit_time) || ~isempty(handles.edit_RendCol)||...
%         ~isempty(handles.edit_RendRow)
%     %mancano ancora da controllare i pop up menu
%         errordlg('Please, Fill In All Fields','Error')
%      
%      else
    
        handles.data.ele_r = str2num(get(handles.edit_elec_r,'String'));
        handles.data.ele_c = str2num(get(handles.edit_elec_c,'String'));
        handles.data.phos_r = str2num(get(handles.edit_phos_r,'String'));
        handles.data.phos_c = str2num(get(handles.edit_phos_c,'String'));
        handles.data.distance = str2num(get(handles.edit_distance,'String'));
        handles.data.r_space = str2num(get(handles.edit_space,'String'));
        handles.data.r_time = str2num(get(handles.edit_time,'String'));
        handles.data.RendCol = str2num(get(handles.edit_RendCol,'String'));
        handles.data.RendRow = str2num(get(handles.edit_RendRow,'String'));
      
        %select modulation prothesis
        list1 = get(handles.pop_mod_prot,'String');
        m = get(handles.pop_mod_prot,'Value');
        handles.data.mod_prot = char(list1(m));

        %select profile
        list2 = get(handles.pop_profile,'String');
        pr = get(handles.pop_profile,'Value');
        handles.data.profile = char(list2(pr));
    
        %select modulation phosphene
        list3 = get(handles.pop_mod_phos,'String');
        ph = get(handles.pop_mod_phos,'Value');
        handles.data.mod_phos = char(list3(ph));
        
        %select type map
        list4 = get(handles.pop_type,'String');
        ty = get(handles.pop_type,'Value');
        handles.data.type_map = char(list4(ty));
        
        %select type rendering
        list5 = get(handles.pop_tyrender,'String');
        tyr = get(handles.pop_tyrender,'Value');
        handles.data.ty_render = char(list5(tyr));

        guidata(hObject,handles)
        % Stored handles.data as global variable (0: used all figure)
        setappdata(0,'varGlobal',handles.data)
        close;
        Main();

     
   
      
function push_clear_Callback(hObject, eventdata, handles)
    
%%  Clear edit and pop menu
    set(handles.edit_elec_r,'String','');
    set(handles.edit_elec_c,'String','');
    set(handles.edit_phos_r,'String','');
    set(handles.edit_phos_c,'String','');
    set(handles.edit_distance,'String',' ');
    set(handles.edit_space,'String','');
    set(handles.edit_time,'String','');
    set(handles.edit_RendCol,'String',' ');
    set(handles.edit_RendRow,'String',' ');
    set(handles.pop_profile,'Value',1);
    set(handles.pop_type,'Value',1);
    set(handles.pop_mod_phos,'Value',1);
    set(handles.pop_mod_prot,'Value',1);
    set(handles.pop_tyrender,'Value',1);
    guidata(hObject,handles);

    
    
function Set_Default_Callback(hObject, eventdata, handles)
%%  Set to defaul value
    
    set(handles.edit_elec_r,'String',num2str(10));
    handles.data.ele_r = 10;
    
    set(handles.edit_elec_c,'String',num2str(10));
    handles.data.ele_c = 10;
    
    set(handles.edit_phos_r,'String',handles.data.ele_r);
    handles.data.phos_r = handles.data.ele_r;
    
    set(handles.edit_phos_c,'String',handles.data.ele_c);
    handles.data.phos_c = handles.data.ele_c;
    
    set(handles.edit_distance,'String',num2str(10));
    handles.data.distance = 10;
    
    set(handles.pop_profile,'Value',3);
    handles.data.profile = 'Circle';
    
    set(handles.edit_space,'String',num2str(10));
    handles.data.r_space = 10;
    
    set(handles.edit_time,'String',num2str(10));
    handles.data.r_time = 10;
    
    set(handles.pop_mod_prot,'Value',2);
    handles.data.mod_prot = 'Voltage';
    
    set(handles.pop_mod_phos,'Value',2);
    handles.data.mod_phos = 'Amplitude';
    
    set(handles.pop_type,'Value',2);
    handles.data.type_map = 'Uniform';
    
    set(handles.pop_tyrender,'Value',2);
    handles.data.ty_render = 'Default';
    
    set(handles.edit_RendRow,'String',num2str(1));
    handles.data.RendRow = 10;
    
    set(handles.edit_RendCol,'String',num2str(1));
    handles.data.RendCol = 10;
    
    guidata(hObject,handles);



function edit_elec_r_Callback(hObject, eventdata, handles)
%%  At the moment: the number phosfene is equal the number electrode 
    a = get(handles.edit_elec_r,'String');
    set(handles.edit_phos_r,'String',a);
    guidata(hObject,handles);

        
function edit_elec_c_Callback(hObject, eventdata, handles)
%%  At the moment: the number phosfene is equal the number electrode 
    a = get(handles.edit_elec_c,'String');
    set(handles.edit_phos_c,'String',a);
    guidata(hObject,handles);
    
    
function pop_tyrender_Callback(hObject, eventdata, handles)
%%  Enable edit Row and Column in case of Design Not Uniform
    tyrend = get(handles.pop_tyrender,'Value');
    if tyrend == 3
       set(handles.edit_RendCol,'Enable','on');
       set(handles.edit_RendRow,'Enable','on');
    else
       set(handles.edit_RendCol,'Enable','off');
       set(handles.edit_RendRow,'Enable','off');
    end
    
    
   
    
    
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


    
function edit_elec_r_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_distance_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_distance_CreateFcn(hObject, eventdata, handles)

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



function edit_RendCol_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_RendCol_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_RendRow_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_RendRow_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close Con_Panel.
function varagout = Con_Panel_CloseRequestFcn(hObject, eventdata, handles,varargin)
 
delete(hObject);


% --- Executes during object creation, after setting all properties.
function pop_tyrender_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_tyrender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


