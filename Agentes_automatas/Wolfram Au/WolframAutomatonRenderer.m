classdef WolframAutomatonRenderer
   properties
       automaton;
       lowColor;
       highColor;
       
   end
   
   
   methods
       function obj = WolframAutomatonRenderer(automaton)
           obj.automaton = automaton;
           obj.lowColor = [141, 150, 144];
           obj.highColor = [93, 252, 136];
           
           
       end
       
       
       function colorGrid = renderAutomaton(obj,steps)
          %Evolucionamos el automata 
          grid = obj.automaton.runAutomaton(steps);
          %Vamos a crear una imagen mas presentable
          [n,m] = size(grid);
          colorGrid = zeros(n,m,3);
          %Supongo que debe haber una forma mas práctica de hacer esto en
          %matlab pero no se me ocurre por el momento
          for i = 1:n
              for j = 1:m
                  if(grid(i,j) == 0)
                      colorGrid(i,j,:) = obj.lowColor;
                  elseif(grid(i,j) == 1)
                      colorGrid(i,j,:) = obj.highColor; 
                  end
              end
          end
          
          maxCol = m;
          
          while(grid(n,maxCol) == 0)
              maxCol = maxCol-1;
          end  
          midCol = (m+1)/2;    
          delta = maxCol - midCol;
          colorGrid = uint8(colorGrid);
          lowX = midCol-delta;
          upX = midCol + delta;
          %Hacemos un dibujo
          h = figure();
          hold on 
          axis off
          title("Automata de wolfram, regla "+ obj.automaton.ruleName)
          image(flip(colorGrid))
          hold off
          xlim([lowX,upX]) 
       end
       
       
       function frames = renderAutomatonAnimation(obj)
           
           
       end
       
   end
    
    
    
end