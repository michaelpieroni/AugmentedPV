function varargout = Statistics_Data(varargin)
% STATISTICS_DATA MATLAB code for Statistics_Data.fig
%      STATISTICS_DATA, by itself, creates a new STATISTICS_DATA or raises the existing
%      singleton*.
%
%      H = STATISTICS_DATA returns the handle to a new STATISTICS_DATA or the handle to
%      the existing singleton*.
%
%      STATISTICS_DATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STATISTICS_DATA.M with the given input arguments.
%
%      STATISTICS_DATA('Property','Value',...) creates a new STATISTICS_DATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Statistics_Data_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Statistics_Data_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Statistics_Data

% Last Modified by GUIDE v2.5 18-Jan-2015 18:44:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Statistics_Data_OpeningFcn, ...
                   'gui_OutputFcn',  @Statistics_Data_OutputFcn, ...
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


% --- Executes just before Statistics_Data is made visible.
function Statistics_Data_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Statistics_Data (see VARARGIN)

% Choose default command line output for Statistics_Data
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Statistics_Data wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Statistics_Data_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in View.
function View_Callback(hObject, eventdata, handles)
    cla;
    num_ele = [ 64 32 16 8 4 0];
    amp = get(handles.ch_amplitude,'Value');
    int = get(handles.ch_intensity,'Value');
    aei = get(handles.ch_am_in,'Value');
    all = get(handles.ch_all,'Value');
    
    if get(handles.ch_ty1,'Value') == 1
        Image = 1;
    else if get(handles.ch_ty2,'Value') == 1
            Image = 2;
        else if get(handles.ch_ty3,'Value') == 1
                Image = 3;
            else if get(handles.ch_ty4,'Value') == 1
                    Image = 4;
                else if get(handles.ch_ty5,'Value') == 1
                        Image = 5;
                    else errordlg('Please, Select one type of image.','Error')
                    end
                end
            end
        end
    end
    
    switch Image
        case {1} 
            %% Show the image data with dimensions 160x120
            if amp == 1
                tempo = [3.614	0.534 0.199 0.062 0.022 0];
            else if int == 1 
                    tempo = [2.33 0.42 0.20	0.066 0.024 0];
                else if aei == 1
                        tempo = [3.32	0.497 0.21 0.059 0.022 0];
                    end 
                end
            end
            if all == 1
               tempo1 = [3.614 0.534 0.199 0.062 0.022 0];
               tempo2 = [2.33 0.42 0.20	0.066 0.024 0];
               tempo3 = [3.32 0.497 0.21 0.059 0.022 0];
               axes(handles.axesGraph);
               plot(num_ele,tempo1,'r:d','linewidth',2);
               hold on; plot(num_ele,tempo2,'g:d','linewidth',2);
               hold on; plot(num_ele,tempo3,'b:d','linewidth',2);               
               legend('Amplitude','Intensity','Amp e Int','Location','northwest');
               legend('boxoff');
               ylabel('time [s]');
               xlabel('Electrodes [ Num ]');
            else
                axes(handles.axesGraph);
                plot(num_ele,tempo,'r:d');
                ylabel('time [s]');
                xlabel('Electrodes [ Num ]');
            end
        case {2}
            %% Show the image data with dimensions 320x240    
            if amp == 1
                tempo = [4.77 2.13 0.616 0.177 0.096 0];
            else if int == 1 
                    tempo = [4.89 2.24 0.63 0.27 0.05 0];
                 else if aei == 1
                     tempo = [4.906 2.12 0.625 0.198 0.93 0];
                     end
                 end
            end
            if all == 1
               tempo1 = [4.77 2.13 0.616 0.177 0.096 0];
               tempo2 = [4.89 2.24 0.63 0.27 0.05 0];
               tempo3 = [4.906 2.12 0.625 0.198 0.93 0];
               axes(handles.axesGraph);
               plot(num_ele,tempo1,'r:d','linewidth',2);
               hold on; plot(num_ele,tempo2,'g:d','linewidth',2);
               hold on; plot(num_ele,tempo3,'b:d','linewidth',2);               
               legend('Amplitude','Intensity','Amp e Int','Location','northwest');
               legend('boxoff');
               ylabel('time [s]');
               xlabel('Electrodes [Num]');
            else
                axes(handles.axesGraph);
                plot(num_ele,tempo,'r:d');
                ylabel('time [s]');
                xlabel('Electrodes [Num]');
            end
            
        case {3}        
            %% Show the image data with dimensions 640x480
            if amp == 1
                tempo = [35.96 9.89 2.78 0.68 0.19 0];
            else if int == 1 
                    tempo = [20.81 7.95 2.76 0.71 0.20 0];
                else if aei == 1
                        tempo = [34.03 10.54 2.83 0.69 0.19 0];
                    end
                end
            end
            if all == 1
               tempo1 = [35.96 9.89 2.78 0.68 0.19 0];
               tempo2 = [20.81 7.95 2.76 0.71 0.20 0];
               tempo3 = [34.03 10.54 2.83 0.69 0.19 0];
               axes(handles.axesGraph);
               plot(num_ele,tempo1,'r:d','linewidth',2);
               hold on; plot(num_ele,tempo2,'g:d','linewidth',2);
               hold on; plot(num_ele,tempo3,'b:d','linewidth',2);               
               legend('Amplitude','Intensity','Amp e Int','Location','northwest');
               legend('boxoff');
               ylabel('time [s]');
               xlabel('Electrodes [Num]');
            else
                axes(handles.axesGraph);
                plot(num_ele,tempo,'r:d');
                ylabel('time [s]');
                xlabel('Electrodes [Num]');
            end
        
        case {4}    
            %% Show the image data with dimensions 1280x720
            if amp == 1
                tempo = [112.19 30.94 7.94 2.04 0.52 0];
            else if int == 1 
                    tempo = [64.30 23.58 7.9 2.05 0.53 0];
                else if aei == 1 
                        tempo = [111.76 31.05 7.76 2.12 0.53 0];
                    end
                end
            end
            if all == 1
               tempo1 = [112.19 30.94 7.94 2.04 0.52 0];
               tempo2 = [64.30 23.58 7.9 2.05 0.53 0];
               tempo3 = [111.76 31.05 7.76 2.12 0.53 0];
               axes(handles.axesGraph);
               plot(num_ele,tempo1,'r:d','linewidth',2);
               hold on; plot(num_ele,tempo2,'g:d','linewidth',2);
               hold on; plot(num_ele,tempo3,'b:d','linewidth',2);               
               legend('Amplitude','Intensity','Amp e Int','Location','northwest');
               legend('boxoff');
               ylabel('time [s]');
               xlabel('Electrodes [Num]');
            else
                axes(handles.axesGraph);
                plot(num_ele,tempo,'r:d');
                ylabel('time [s]');
                xlabel('Electrodes [Num]');
            end
            
        case {5}
            %% Show the image data with dimensions  1920x1080
            if amp == 1
                tempo = [272.83 68.38 17.96 4.40 1.12 0];
            else if int == 1 
                    tempo = [182.31 50.57 17.42 4.83 1.13 0];
                else if aei == 1
                        tempo = [272.13 73.21 16.63 4.65 1.14 0];
                    end
                end
            end
            if all == 1
               tempo1 = [272.83 68.38 17.96 4.40 1.12 0];
               tempo2 = [182.31 50.57 17.42 4.83 1.13 0];
               tempo3 = [272.13 73.21 16.63 4.65 1.14 0];
               axes(handles.axesGraph);
               plot(num_ele,tempo1,'r:d','linewidth',2);
               hold on; plot(num_ele,tempo2,'g:d','linewidth',2);
               hold on; plot(num_ele,tempo3,'b:d','linewidth',2);               
               legend('Amplitude','Intensity','Amp e Int','Location','northwest');
               legend('boxoff');
               ylabel('time [s]');
               xlabel('Electrodes [Num]');
            else
                axes(handles.axesGraph);
                plot(num_ele,tempo,'r:d');
                ylabel('time [s]');
                xlabel('Electrodes [Num]');
            end
    end
    if all ~= 1 
        set(handles.edit4,'String',tempo(5));
        set(handles.edit8,'String',tempo(4));
        set(handles.edit16,'String',tempo(3));
        set(handles.edit32,'String',tempo(2));
        set(handles.edit64,'String',tempo(1));
    else
        set(handles.edit4,'String','');
        set(handles.edit8,'String','');
        set(handles.edit16,'String','');
        set(handles.edit32,'String','');
        set(handles.edit64,'String','');
    end
    


% --- Executes on button press in Clear.
function Clear_Callback(hObject, eventdata, handles)



% --- Executes on button press in ch_ty1.
function ch_ty1_Callback(hObject, eventdata, handles)
    set(handles.ch_ty2,'Value',0);
    set(handles.ch_ty3,'Value',0);
    set(handles.ch_ty4,'Value',0);
    set(handles.ch_ty5,'Value',0);
    
    

% --- Executes on button press in ch_ty2.
function ch_ty2_Callback(hObject, eventdata, handles)
    set(handles.ch_ty1,'Value',0);
    set(handles.ch_ty3,'Value',0);
    set(handles.ch_ty4,'Value',0);
    set(handles.ch_ty5,'Value',0);


% --- Executes on button press in ch_ty3.
function ch_ty3_Callback(hObject, eventdata, handles)
    set(handles.ch_ty1,'Value',0);
    set(handles.ch_ty2,'Value',0);
    set(handles.ch_ty4,'Value',0);
    set(handles.ch_ty5,'Value',0);


% --- Executes on button press in ch_ty4.
function ch_ty4_Callback(hObject, eventdata, handles)
    set(handles.ch_ty1,'Value',0);
    set(handles.ch_ty2,'Value',0);
    set(handles.ch_ty3,'Value',0);
    set(handles.ch_ty5,'Value',0);


% --- Executes on button press in ch_ty5.
function ch_ty5_Callback(hObject, eventdata, handles)
    set(handles.ch_ty1,'Value',0);
    set(handles.ch_ty2,'Value',0);
    set(handles.ch_ty3,'Value',0);
    set(handles.ch_ty4,'Value',0);


% --- Executes on button press in ch_am_in.
function ch_am_in_Callback(hObject, eventdata, handles)
    set(handles.ch_intensity,'Value',0);
    set(handles.ch_amplitude,'Value',0);
    set(handles.ch_all,'Value',0);


% --- Executes on button press in ch_intensity.
function ch_intensity_Callback(hObject, eventdata, handles)
    set(handles.ch_am_in,'Value',0);
    set(handles.ch_amplitude,'Value',0);
    set(handles.ch_all,'Value',0);


% --- Executes on button press in ch_amplitude.
function ch_amplitude_Callback(hObject, eventdata, handles)
    set(handles.ch_intensity,'Value',0);
    set(handles.ch_am_in,'Value',0);
    set(handles.ch_all,'Value',0);


% --- Executes on button press in ch_all.
function ch_all_Callback(hObject, eventdata, handles)
    set(handles.ch_intensity,'Value',0);
    set(handles.ch_amplitude,'Value',0);
    set(handles.ch_am_in,'Value',0);
    
    



function edit4_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit32_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit64_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit64_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
