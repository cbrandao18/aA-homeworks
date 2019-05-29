const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

reader.question(
    "Would you like some tea?", 
    function(answer){
        console.log(`you replied ${answer}`);
        reader.question('Would you like some biscuits?', function (answer2) {
            console.log(`You replied ${answer2}.`);

            const tea = (answer === 'yes') ? 'do' : 'don\'t';
            const biscuits = (answer2 === 'yes') ? 'do' : 'don\'t';

            console.log(`So you ${tea} want tea and you ${biscuits} want biscuits.`);
            reader.close();
        });
    }
);