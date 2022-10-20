function varargout = Trabalho_2_GUI(varargin)
% TRABALHO_2_GUI MATLAB code for Trabalho_2_GUI.fig
%      TRABALHO_2_GUI, by itself, creates a new TRABALHO_2_GUI or raises the existing
%      singleton*.
%
%      H = TRABALHO_2_GUI returns the handle to a new TRABALHO_2_GUI or the handle to
%      the existing singleton*.
%
%      TRABALHO_2_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRABALHO_2_GUI.M with the given input arguments.
%
%      TRABALHO_2_GUI('Property','Value',...) creates a new TRABALHO_2_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Trabalho_2_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Trabalho_2_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Trabalho_2_GUI

% Last Modified by GUIDE v2.5 05-Jun-2020 14:50:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Trabalho_2_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Trabalho_2_GUI_OutputFcn, ...
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


% --- Executes just before Trabalho_2_GUI is made visible.
function Trabalho_2_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Trabalho_2_GUI (see VARARGIN)

% Choose default command line output for Trabalho_2_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Trabalho_2_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Trabalho_2_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in figurapat.
function figurapat_Callback(hObject, eventdata, handles) %popup menu
% hObject    handle to figurapat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns figurapat contents as cell array
%        contents{get(hObject,'Value')} returns selected item from figurapat
contents = cellstr(get(hObject,'String'))
fig = contents{get(hObject,'Value')}
if fig == 'Figura 1'
    load dados1;
    theta = atan2(y(:,2)-y(:,1),x(:,2)-x(:,1));
    theta1=unwrap(theta);
    
    
    
    t=transpose(linspace(ti,tf,length(x(:,1)))); %tempo de frame de aquisicao
    tint = linspace(t(1),t(end),length(t)*2*n); %tempo interpolacao
    
    yint=interp1(t,theta1,tint,'spline','extrap');
    
    [tmaxmin,ymaxmin,f,sf]=maxmin(tint,yint);
    
    
    
    set(handles.frequencia,'String',f);
    set(handles.errof,'String',sf)
    
    xlim(handles.grafico,[2.5 max(tint)+0.5]);
    ylim(handles.grafico,[0.7 max(yint)]+0.2);
    plot(handles.grafico,tint,yint,'r',t,theta1,'b',tmaxmin,ymaxmin,'g.','MarkerSize',10);
    hold(handles.grafico,'off')
    mv= VideoReader('video1.mp4');
    n=5; % ler frames de n em n
    dtframes=n/mv.FrameRate; % tempo entre frames a ler
    
    t=ti;i=0;
    %video com linha
    while (t <= tf)
        mv.CurrentTime=t;
        mov=readFrame(mv); image(mov);
        t=t+dtframes; i=i+1;
        hold(handles.video,'on')
        plot(x(i,:),y(i,:),'k','LineWidth',3)
        hold(handles.video,'off')
    end
    
elseif fig == 'Figura 2'
    load dados2;
    dx=x(:,1)-x(:,2);
    
    t=transpose(linspace(ti,tf,length(x(:,1)))); %tempo de frame de aquisicao
    tint = linspace(t(1),t(end),length(t)*2*n); %tempo interpolacao
    
    yint=interp1(t,dx,tint,'spline','extrap');
    
    [tmaxmin,ymaxmin,f,sf]=maxmin(tint,yint);
    
    
    
    set(handles.frequencia,'String',f);
    set(handles.errof,'String',sf)
    
    xlim(handles.grafico,[2.5 max(tint)+0.5]);
    ylim(handles.grafico,[0.7 max(yint)]+0.2);
    plot(handles.grafico,tint,yint,'r',t,dx,'b',tmaxmin,ymaxmin,'g.','MarkerSize',10);
    hold(handles.grafico,'off')
    mv= VideoReader('video1.mp4');
    n=5; % ler frames de n em n
    dtframes=n/mv.FrameRate; % tempo entre frames a ler
    
    t=ti;i=0;
    %video com linha
    while (t <= tf)
        mv.CurrentTime=t;
        mov=readFrame(mv); image(mov);
        t=t+dtframes; i=i+1;
        hold(handles.video,'on')
        plot(x(i,:),y(i,:),'k','LineWidth',3)
        hold(handles.video,'off')
    end
elseif fig == 'Figura 3'
    load dados3;
    theta = atan2(y(:,2)-y(:,1),x(:,2)-x(:,1));
    theta1=unwrap(theta);
    
    
    
    t=transpose(linspace(ti,tf,length(x(:,1)))); %tempo de frame de aquisicao
    tint = linspace(t(1),t(end),length(t)*2*n); %tempo interpolacao
    
    yint=interp1(t,theta1,tint,'spline','extrap');
    
    [tmaxmin,ymaxmin,f,sf]=maxmin(tint,yint);
    
    
    
    set(handles.frequencia,'String',f);
    set(handles.errof,'String',sf)
    
    xlim(handles.grafico,[2.5 max(tint)+0.5]);
    ylim(handles.grafico,[0.7 max(yint)]+0.2);
    plot(handles.grafico,tint,yint,'r',t,theta1,'b',tmaxmin,ymaxmin,'g.','MarkerSize',10);
    hold(handles.grafico,'off')
    mv= VideoReader('video1.mp4');
    n=5; % ler frames de n em n
    dtframes=n/mv.FrameRate; % tempo entre frames a ler
    
    t=ti;i=0;
    %video com linha
    while (t <= tf)
        mv.CurrentTime=t;
        mov=readFrame(mv); image(mov);
        t=t+dtframes; i=i+1;
        hold(handles.video,'on')
        plot(x(i,:),y(i,:),'k','LineWidth',3)
        hold(handles.video,'off')
    end
elseif fig == 'Figura 4'
    load dados4;
    theta = atan2(y(:,2)-y(:,1),x(:,2)-x(:,1));
    theta1=unwrap(theta);
    
    
    
    t=transpose(linspace(ti,tf,length(x(:,1)))); %tempo de frame de aquisicao
    tint = linspace(t(1),t(end),length(t)*2*n); %tempo interpolacao
    
    yint=interp1(t,theta1,tint,'spline','extrap');
    
    [tmaxmin,ymaxmin,f,sf]=maxmin(tint,yint);
    
    
    
    set(handles.frequencia,'String',f);
    set(handles.errof,'String',sf)
    
    xlim(handles.grafico,[2.5 max(tint)+0.5]);
    ylim(handles.grafico,[0.7 max(yint)]+0.2);
    plot(handles.grafico,tint,yint,'r',t,theta1,'b',tmaxmin,ymaxmin,'g.','MarkerSize',10);
    hold(handles.grafico,'off')
    mv= VideoReader('video1.mp4');
    n=5; % ler frames de n em n
    dtframes=n/mv.FrameRate; % tempo entre frames a ler
    
    t=ti;i=0;
    %video com linha
    while (t <= tf)
        mv.CurrentTime=t;
        mov=readFrame(mv); image(mov);
        t=t+dtframes; i=i+1;
        hold(handles.video,'on')
        plot(x(i,:),y(i,:),'k','LineWidth',3)
        hold(handles.video,'off')
    end
    
    
    
    
end
    

% --- Executes during object creation, after setting all properties.
function figurapat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figurapat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function frequencia_Callback(hObject, eventdata, handles)
% hObject    handle to frequencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frequencia as text
%        str2double(get(hObject,'String')) returns contents of frequencia as a double


% --- Executes during object creation, after setting all properties.
function frequencia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frequencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function errof_Callback(hObject, eventdata, handles)
% hObject    handle to errof (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of errof as text
%        str2double(get(hObject,'String')) returns contents of errof as a double


% --- Executes during object creation, after setting all properties.
function errof_CreateFcn(hObject, eventdata, handles)
% hObject    handle to errof (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
