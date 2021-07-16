function Menue_Auswahl_Plot_nach(Zeit, Ver_w_Werktag, A_w_Werktag, ...
    Ver_w_Samstag, A_w_Samstag, ...
    Ver_w_Sonntag, A_w_Sonntag, ...
    Ver_s_Werktag, A_s_Werktag, ...
    Ver_s_Samstag, A_s_Samstag, ...
    Ver_s_Sonntag, A_s_Sonntag, ...
    Ver_u_Werktag, A_u_Werktag, ...
    Ver_u_Samstag, A_u_Samstag, ...
    Ver_u_Sonntag, A_u_Sonntag, ...
    AnzH, AnzA)

%Aufruf des Dropdown-Menüs
gui(Zeit, Ver_w_Werktag, A_w_Werktag, ...
    Ver_w_Samstag, A_w_Samstag, ...
    Ver_w_Sonntag, A_w_Sonntag, ...
    Ver_s_Werktag, A_s_Werktag, ...
    Ver_s_Samstag, A_s_Samstag, ...
    Ver_s_Sonntag, A_s_Sonntag, ...
    Ver_u_Werktag, A_u_Werktag, ...
    Ver_u_Samstag, A_u_Samstag, ...
    Ver_u_Sonntag, A_u_Sonntag, ...
    AnzH, AnzA);
return


function gui(Zeit, Ver_w_Werktag, A_w_Werktag, ...
    Ver_w_Samstag, A_w_Samstag, ...
    Ver_w_Sonntag, A_w_Sonntag, ...
    Ver_s_Werktag, A_s_Werktag, ...
    Ver_s_Samstag, A_s_Samstag, ...
    Ver_s_Sonntag, A_s_Sonntag, ...
    Ver_u_Werktag, A_u_Werktag, ...
    Ver_u_Samstag, A_u_Samstag, ...
    Ver_u_Sonntag, A_u_Sonntag, ...
    AnzH, AnzA)

% Figure erstellen 
h = figure('ToolBar', 'None', ... 
  'MenuBar', 'None', ... 
  'Resize', 'off', ... 
  'Name', 'Plot Selection', ... 
  'NumberTitle', 'off', ... 
  'Position', [300 300 210 110]); 
 
% Label erstellen 
uicontrol(h, 'Style', 'text', ... 
  'Position', [10 85 80 15], ... 
  'String', 'Jahreszeit', ... 
  'HorizontalAlignment', 'Center', 'FontWeight', 'Bold');

uicontrol(h, 'Style', 'text', ... 
  'Position', [10 55 80 15], ... 
  'String', 'Tag', ... 
  'HorizontalAlignment', 'Center', 'FontWeight', 'Bold'); 
 
% Dropdown-Feld1 erstellen 
t = uicontrol(h, 'Style', 'PopupMenu', ... 
  'Position', [105 77 100 25], ... 
  'String', {'Winter' 'Sommer' 'Uebergang'}); 
 
% Dropdown-Feld2 erstellen 
a = uicontrol(h, 'Style', 'PopupMenu', ... 
  'Position', [105 47 100 25], ... 
  'String', {'Werktag', 'Samstag', 'Sonntag'});
 
% Button erstellen 
uicontrol(h, 'Style', 'PushButton', ... 
  'Position', [130 10 75 25], ... 
  'String', 'Ok', ... 
  'Callback', {@OnOkClick, a, t, ...
    Zeit, Ver_w_Werktag, A_w_Werktag, ...
    Ver_w_Samstag, A_w_Samstag, ...
    Ver_w_Sonntag, A_w_Sonntag, ...
    Ver_s_Werktag, A_s_Werktag, ...
    Ver_s_Samstag, A_s_Samstag, ...
    Ver_s_Sonntag, A_s_Sonntag, ...
    Ver_u_Werktag, A_u_Werktag, ...
    Ver_u_Samstag, A_u_Samstag, ...
    Ver_u_Sonntag, A_u_Sonntag, ...
    AnzH, AnzA}); 

% Quit-Button erstellen
uicontrol(h, 'Style', 'PushButton', ... 
  'Position', [20 10 75 25], ... 
  'String', 'Quit', ... 
  'Callback', {@OnQuitClick}); 
 
% Figure darstellen 
set(h, 'Visible', 'on'); 

function [season2, day2] = OnOkClick (obj, e, d, s, ...
    Zeit, Ver_w_Werktag, A_w_Werktag, ...
    Ver_w_Samstag, A_w_Samstag, ...
    Ver_w_Sonntag, A_w_Sonntag, ...
    Ver_s_Werktag, A_s_Werktag, ...
    Ver_s_Samstag, A_s_Samstag, ...
    Ver_s_Sonntag, A_s_Sonntag, ...
    Ver_u_Werktag, A_u_Werktag, ...
    Ver_u_Samstag, A_u_Samstag, ...
    Ver_u_Sonntag, A_u_Sonntag, ...
    AnzH, AnzA)

day = get(d, 'String');
day = day{get(d, 'Value')};
day2 = get(d, 'Value');
 
season = get(s, 'String');
season = season{get(s, 'Value')};
season2 = get(s, 'Value');
 
assignin('base', 'day', day);
assignin('base', 'day2', day2);
assignin('base', 'season', season);
assignin('base', 'season2', season2);

baseLine = 0;
index = 1:96;

switch season2
    
    case 1
        
        switch day2
            
            case 1
                figure ('name','Winter Werktag');
                hold on 
                plot_hh = plot(Zeit, A_w_Werktag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine A_w_Werktag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_ver = plot(Zeit, Ver_w_Werktag, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine Ver_w_Werktag(index)' baseLine],'g','EdgeColor','none');
                datetick('x')
                title({' ' 'Winter Werktag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_hh, plot_ver], 'Lastgang Haushalt', 'Lastgang Verschiebbare Last','Location','southoutside','Orientation','horizontal');
                grid on
                hold off
                disp(' ');
                disp('Winter Werktag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
            case 2
                figure ('name','Winter Samstag');
                hold on 
                plot_hh = plot(Zeit, A_w_Samstag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine A_w_Samstag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_ver = plot(Zeit, Ver_w_Samstag, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine Ver_w_Samstag(index)' baseLine],'g','EdgeColor','none');
                datetick('x')
                title({' ' 'Winter Samstag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_hh, plot_ver], 'Lastgang Haushalt', 'Lastgang Verschiebbare Last','Location','southoutside','Orientation','horizontal');
                grid on
                hold off
                disp(' ');
                disp('Winter Samstag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
            case 3
                figure ('name','Winter Sonntag');
                hold on 
                plot_hh = plot(Zeit, A_w_Sonntag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine A_w_Sonntag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_ver = plot(Zeit, Ver_w_Sonntag, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine Ver_w_Sonntag(index)' baseLine],'g','EdgeColor','none');
                datetick('x')
                title({' ' 'Winter Sonntag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_hh, plot_ver], 'Lastgang Haushalt', 'Lastgang Verschiebbare Last','Location','southoutside','Orientation','horizontal');
                grid on
                hold off
                disp(' ');
                disp('Winter Sonntag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
        end
        
    case 2
        
        switch day2
            
            case 1
                figure ('name','Sommer Werktag');
                hold on 
                plot_hh = plot(Zeit, A_s_Werktag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine A_s_Werktag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_ver = plot(Zeit, Ver_s_Werktag, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine Ver_s_Werktag(index)' baseLine],'g','EdgeColor','none');
                datetick('x')
                title({' ' 'Sommer Werktag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_hh, plot_ver], 'Lastgang Haushalt', 'Lastgang Verschiebbare Last','Location','southoutside','Orientation','horizontal');
                grid on
                hold off
                disp(' ');
                disp('Sommer Werktag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
            case 2
                figure ('name','Sommer Samstag');
                hold on 
                plot_hh = plot(Zeit, A_s_Samstag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine A_s_Samstag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_ver = plot(Zeit, Ver_s_Samstag, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine Ver_s_Samstag(index)' baseLine],'g','EdgeColor','none');
                datetick('x')
                title({' ' 'Sommer Samstag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_hh, plot_ver], 'Lastgang Haushalt', 'Lastgang Verschiebbare Last','Location','southoutside','Orientation','horizontal');
                grid on
                hold off
                disp(' ');
                disp('Sommer Samstag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
            case 3
                figure ('name','Sommer Sonntag');
                hold on 
                plot_hh = plot(Zeit, A_s_Sonntag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine A_s_Sonntag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_ver = plot(Zeit, Ver_s_Sonntag, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine Ver_s_Sonntag(index)' baseLine],'g','EdgeColor','none');
                datetick('x')
                title({' ' 'Sommer Sonntag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_hh, plot_ver], 'Lastgang Haushalt', 'Lastgang Verschiebbare Last','Location','southoutside','Orientation','horizontal');
                grid on
                hold off
                disp(' ');
                disp('Sommer Sonntag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
        end
        
    case 3
        
        switch day2
            
            case 1
                figure ('name','Übergang Werktag');
                hold on 
                plot_hh = plot(Zeit, A_u_Werktag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine A_u_Werktag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_ver = plot(Zeit, Ver_u_Werktag, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine Ver_u_Werktag(index)' baseLine],'g','EdgeColor','none');
                datetick('x')
                title({' ' 'Übergang Werktag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_hh, plot_ver], 'Lastgang Haushalt', 'Lastgang Verschiebbare Last','Location','southoutside','Orientation','horizontal');
                grid on
                hold off
                disp(' ');
                disp('Übergang Werktag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
            case 2
                figure ('name','Übergang Samstag');
                hold on 
                plot_hh = plot(Zeit, A_u_Samstag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine A_u_Samstag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_ver = plot(Zeit, Ver_u_Samstag, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine Ver_u_Samstag(index)' baseLine],'g','EdgeColor','none');
                datetick('x')
                title({' ' 'Übergang Samstag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_hh, plot_ver], 'Lastgang Haushalt', 'Lastgang Verschiebbare Last','Location','southoutside','Orientation','horizontal');
                grid on
                hold off
                disp(' ');
                disp('Übergang Samstag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
            case 3
                figure ('name','Übergang Sonntag');
                hold on 
                plot_hh = plot(Zeit, A_u_Sonntag, 'b', 'LineWidth', 1);
                h1 = fill(Zeit(index([1 1:end end])),[baseLine A_u_Sonntag(index)' baseLine],'b','EdgeColor','none');
                datetick('x')
                plot_ver = plot(Zeit, Ver_u_Sonntag, 'g','LineWidth', 1);
                h2 = fill(Zeit(index([1 1:end end])),[baseLine Ver_u_Sonntag(index)' baseLine],'g','EdgeColor','none');
                datetick('x')
                title({' ' 'Übergang Sonntag' ' '});
                xlabel('Uhrzeit');
                ylabel('kW');
                legend ([plot_hh, plot_ver], 'Lastgang Haushalt', 'Lastgang Verschiebbare Last','Location','southoutside','Orientation','horizontal');
                grid on
                hold off
                disp(' ');
                disp('Übergang Sonntag');
                disp(' ');
                disp(AnzH);
                disp(' ');
                disp(AnzA);
                disp(' ');
                
        end
        
end


function OnQuitClick (obj, e)
close(gcbf);
disp(' ');
disp('Programm beendet');
disp(' ');
return;
