#!/bin/fish
playerctl -p 'spotify' --follow metadata --format $(echo -n -e '{{artist}}\t{{title}}\t{{status}}\t{{position}}\t{{mpris:length}}\t{{mpris:artUrl}}\t{{duration(position)}}\t{{loop}}\t{{shuffle}}') | while read -l f
    echo -n $f | awk -F\t '{gsub(/"/, "\\\\\\""); print("{\\"display\\": \\""$1" - "$2"\\", \\"artist\\": \\""$1"\\", \\"title\\": \\""$2"\\", \\"status\\": \\""$3"\\", \\"position\\": "$4", \\"length\\": "$5", \\"cover\\": \\""$6"\\", \\"duration\\": \\""$7"\\", \\"repeat\\": \\""$8"\\", \\"shuffle\\": \\""$9"\\" }")}'
end
