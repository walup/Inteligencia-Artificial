classdef RuleGenerator
    
    methods
        
        function rule = getRule(obj,ruleType)
            rule = zeros(8,1);
            %Regla 30
            if(ruleType == RuleType.RULE_30)
                rule(1) = 0;
                rule(2) = 1;
                rule(3) = 1;
                rule(4) = 1;
                rule(5) = 1;
                rule(6) = 0;
                rule(7) = 0;
                rule(8) = 0;
            
            %Regla 60
            elseif(ruleType == RuleType.RULE_60)
                rule(1) = 0;
                rule(2) = 0;
                rule(3) = 1;
                rule(4) = 1;
                rule(5) = 1;
                rule(6) = 1;
                rule(7) = 0;
                rule(8) = 0;
            
            %Regla 90
            elseif(ruleType == RuleType.RULE_90)
                rule(1) = 0;
                rule(2) = 1;
                rule(3) = 0;
                rule(4) = 1;
                rule(5) = 1;
                rule(6) = 0;
                rule(7) = 1;
                rule(8) = 0;
            end
            
        end
        
    end
    
    
    
end