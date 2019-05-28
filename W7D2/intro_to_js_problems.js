function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping2() {
    const x = 'out of block';
    if (true) {
        const x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping3() {
    const x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping4() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping5() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    let x = 'out of block again';
    console.log(x);
}

function madLib(verb, adj, noun) {
    return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
}

function isSubstring(phrase, subphrase) {
    return phrase.includes(subphrase);
}

function fizzBuzz(array) {
    const arr = [];

    array.forEach(el => {
        if ((el % 3 === 0) ^ (el % 5 === 0)) {
            arr.push(el);
        }
    });

    return arr;
}

function isPrime(n) {
    if (n < 2) { return false; }

    for (let i = 2; i < n; i++) {
        if (n % i === 0) {
            return false;
        }
    }

    return true;
}

function sumOfNPrimes(n) {
    let sum = 0;
    let count = 0;
    let i = 2;

    while (count < n) {
        if (isPrime(i)) {
            sum += i;
            count++;
        }
        i++;
    }

    return sum;
}