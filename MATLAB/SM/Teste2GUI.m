function varargout = Teste2GUI(varargin)
% TESTE2GUI MATLAB code for Teste2GUI.fig
%      TESTE2GUI, by itself, creates a new TESTE2GUI or raises the existing
%      singleton*.
%
%      H = TESTE2GUI returns the handle to a new TESTE2GUI or the handle to
%      the existing singleton*.
%
%      TESTE2GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TESTE2GUI.M with the given input arguments.
%
%      TESTE2GUI('Property','Value',...) creates a new TESTE2GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Teste2GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Teste2GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Teste2GUI

% Last Modified by GUIDE v2.5 12-Jun-2020 10:08:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Teste2GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Teste2GUI_OutputFcn, ...
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


% --- Executes just before Teste2GUI is made visible.
function Teste2GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Teste2GUI (see VARARGIN)

% Choose default command line output for Teste2GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Teste2GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Teste2GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function aEdit_Callback(hObject, eventdata, handles)
% hObject    handle to aEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aEdit as text
%        str2double(get(hObject,'String')) returns contents of aEdit as a double


% --- Executes during object creation, after setting all properties.
function aEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bEdit_Callback(hObject, eventdata, handles)
% hObject    handle to bEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bEdit as text
%        str2double(get(hObject,'String')) returns contents of bEdit as a double


% --- Executes during object creation, after setting all properties.
function bEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cEdit_Callback(hObject, eventdata, handles)
% hObject    handle to cEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cEdit as text
%        str2double(get(hObject,'String')) returns contents of cEdit as a double


% --- Executes during object creation, after setting all properties.
function cEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2double(get(handles.aEdit,'String'));
b = str2double(get(handles.bEdit,'String'));
c = str2double(get(handles.cEdit,'String'));

for x=-20:20
    y = a*(x^2)+(b*x)+c;
    plot(handles.axes1,x,y,'b.');
    hold(handles.axes1,'on')
    xlim(handles.axes1,[-50.1 50.1])
    ylim(handles.axes1, [-50 50])
end
hold(handles.axes1,'off')
    
