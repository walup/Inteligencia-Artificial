classdef ConwaysGameOfLife
   properties
      initialGrid; 
      %Tamaño del mundo
      gridWidth;
      gridHeight;
   end
   
   
   methods
       function obj = ConwaysGameOfLife(initialGrid)
           %Inicializamos el mapa
           obj.initialGrid = initialGrid;
           %El tamaño del mapa
           obj.gridHeight = size(initialGrid,1);
           obj.gridWidth = size(initialGrid,2);
       end
       
       function evolutionGrid = evolveGrid(obj,steps)
           %Preallocate
           evolutionGrid = zeros(obj.gridHeight,obj.gridWidth,steps);
           evolutionGrid(:,:,1) = obj.initialGrid;
           %Está un poco ineficiente esto pero bueno
           for s = 2:steps
              prevGrid = evolutionGrid(:,:,s-1);
              for i = 2:obj.gridHeight-1
                 for j = 2:obj.gridWidth-1
                     sum = prevGrid(i-1,j-1) + prevGrid(i-1,j) + prevGrid(i-1,j+1) + prevGrid(i,j-1) + prevGrid(i,j+1) + prevGrid(i+1,j-1) + prevGrid(i+1,j) + prevGrid(i+1,j+1);
                     state = prevGrid(i,j);
                     %Death
                     if(state == 1 && (sum < 2 || sum >3))
                         evolutionGrid(i,j,s) = 0;
                     %Supervivencia 
                     elseif(state == 1 && (sum == 2 || sum == 3))
                         evolutionGrid(i,j,s) = 1;
                     %Nacimiento
                     elseif(state == 0 && sum == 3)
                         evolutionGrid(i,j,s) = 1;
                     end
                     
                 end
              end
           end
       end
       
       
   end
    
    
    
end