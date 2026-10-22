#!/bin/bash

# Generate a random number between 0 and 20
# $RANDOM generates a number between 0 and 32767
# % 21 limits it to 0 through 20
SECRET_NUMBER=$(( RANDOM % 21 ))
ATTEMPTS=0

echo "🎲 Welcome to the Bash Number Guessing Game!"
echo "I'm thinking of a number between 0 and 20."

# Start an infinite loop
while true; do
    # -p prompts the user, and the answer is saved to the GUESS variable
    read -p "Enter your guess: " GUESS

    # Increase the attempt counter by 1
    ((ATTEMPTS++))

    # Check if the user entered a valid number
    if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then
        echo "❌ Error: Please enter a valid number."
        continue
    fi

    # The actual game logic
    if (( GUESS < SECRET_NUMBER )); then
        echo "📉 Too low! Try again."
    elif (( GUESS > SECRET_NUMBER )); then
        echo "📈 Too high! Try again."
    else
        echo "🎉 Correct! You guessed the number in $ATTEMPTS attempts."
        break # Exit the loop if they win
    fi
done
