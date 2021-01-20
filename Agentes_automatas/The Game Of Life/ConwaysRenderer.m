classdef ConwaysRenderer
   properties
       gameOfLife;
       deadColor;
       aliveColor;
   end
    
    
   methods
       function obj = ConwaysRenderer(gameOfLife)
          %Los colores de las células muertas y vivas. 
          obj.deadColor = [141, 150, 144];
          obj.aliveColor = [93, 252, 136];
          obj.gameOfLife = gameOfLife;
       end
       
       function frames = renderEvolution(obj,steps)
          %Aquí el método puede ser computacionalmente pesado asi que será
          %bueno usar una barra de espera
          bar = waitbar(0, "Evolucionando sistema");
          evolution = obj.gameOfLife.evolveGrid(steps);
          [n,m,f] = size(evolution);
          %Creamos el arreglo de frames
          frames(f) = struct('cdata',[],'colormap',[]);
          h = figure();
          xlim([0,obj.gameOfLife.gridWidth])
          ylim([0,obj.gameOfLife.gridHeight])
          frameGrid = zeros(n,m,3);
          %Para cada frame
          for s = 1:f
              waitbar(s/f,bar, "Obteniendo frame "+string(s));
              g = evolution(:,:,s);
              for i = 1:n
                  for j = 1:m
                      if(g(i,j) == 0)
                          frameGrid(i,j,:) = obj.deadColor;
                      elseif(g(i,j) == 1)
                          frameGrid(i,j,:) = obj.aliveColor;
                      end
                  end
              end
              frameGrid = uint8(frameGrid);
              hold on 
              image([0,obj.gameOfLife.gridWidth],[0,obj.gameOfLife.gridHeight],flip(frameGrid))
              %image(flip(frameGrid))
              
              hold off
              grid off
              axis off
              xlim([0,obj.gameOfLife.gridWidth])
              ylim([0,obj.gameOfLife.gridHeight])
              drawnow
              frames(s) = getframe(h);
              clf(h,'reset')
          end
          
           
          delete(bar) 
       end
       
   end
    
    
end