function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 15-May-2020 10:01:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function amplitude_Callback(hObject, eventdata, handles)
% hObject    handle to amplitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amplitude as text
%        str2double(get(hObject,'String')) returns contents of amplitude as a double


% --- Executes during object creation, after setting all properties.
function amplitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amplitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function periodo_Callback(hObject, eventdata, handles)
% hObject    handle to periodo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of periodo as text
%        str2double(get(hObject,'String')) returns contents of periodo as a double


% --- Executes during object creation, after setting all properties.
function periodo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to periodo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in inicio.
function inicio_Callback(hObject, eventdata, handles)
% hObject    handle to inicio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A= str2num(get(handles.amplitude,'string')) % lê strings das caixas de
%texto e converte-as em numeros
T= str2num(get(handles.periodo,'string'))
fase= get(handles.slider1,'value')
% lê o campo value, que já é um numero
faseRad= fase*2*pi/360;
% conversão de graus para radianos
tmax=100;
% tempo máximo
dt= 0.2;
% vamos apresentar a simulacao de 0.2 em 0.2 segundos
i=1;
x0=A+1;
% para que a massa não bata na parede, incluimos um x0
% que é uma unidade superior a A.
for t=0:dt:tmax
x(i)= x0+A*cos(2*pi/T*t+faseRad); % i-nésimo valor de x é guardado no
% i-nésimo elemento dos vetores x e t
tempo(i)=t;
i=i+1;
end
for i=1:length(tempo)
% faz a simulação
plot(handles.axes1,[0 0 max(x)*1.1],[1 0 0],'-','linewidth',2)
 xlim(handles.axes1,[-0.1 max(x)*1.1])
 ylim(handles.axes1,[-0.5 2])
 xx=linspace(0,x(i),100); %xx contem 100 pontos entre 0 e x(i)
 lambda=(x(i)-0)/10;
 yy=0.15*sin(2*pi*xx/lambda)+0.25;
% % representação da mola como uma onda
% %com no de maximos constante, ou seja c.d.o. variável.
 hold (handles.axes1,'on')
 plot(handles.axes1,xx,yy,'-r');
 plot(handles.axes1,x(i),0.3,'ro','Markersize',18,'MarkerFaceColor','r')
 hold(handles.axes1,'off')
 plot(handles.axes2,tempo(1:i),x(1:i),'.b')
 xlim(handles.axes2,[0 50]);
 ylim(handles.axes2,[min(x) max(x)]);
 pause(dt)
 drawnow
end
