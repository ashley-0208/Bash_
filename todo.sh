#!/bin/bash
TODO_FILE="todo.txt"

echo "please choose:"
echo "1. add task"
echo "2. show tasks"
echo "3. delete tasks"
echo "4. exit"

read -p "choice num.: " choice

case $choice in 
    1) 
        read -p "new task:" task
        echo "$task" >> "$TODO_FILE"
        echo "new task added."
        ;;
    
    2)
        echo "task list:"
        nl "$TODO_FILE"
        ;;
    
    3)
        nl "$TODO_FILE"
        read -p "which task do you want to delete?" num
        sed -i "${num}d" "$TODO_FILE"
        echo "task deleted."
        ;;
    4)
        echo "exit."
        exit 0
        ;;
    *)
        echo "invalid choice!"
        ;;
        
esac