// function madLib(a,b,c) {
//   return `We shall ${a.toUpperCase()} the ${b.toUpperCase()} ${c.toUpperCase()}`
// }

// console.log(madLib("hello", "im", "bruce"))

// function isSubstring(string1, string2) {
//   var found = false
//   string1.split(' ').forEach(function(element) {
//     if (element == string2) {
//       found = true
//     }
//   })
//   return found 
// }

// console.log(isSubstring("time to program", "time"))
// console.log(isSubstring("Jump for joy", "joys"))

// let fizzBuz = (array) => {
//   new_arr = [];
//   array.forEach(function(e) {
//     if (e % 3 == 0 && e % 5 == 0)
//       return 
//     else if (e % 3 == 0) {
//       new_arr.push(e);
//     } else if (e % 5 == 0) {
//       new_arr.push(e);
//     }
//   })
//   return new_arr
// }

// console.log(fizzBuz([1,2,3,4,5,6,7,8,9,10]))

// function isPrime(n) {
//   if (n == 1 || n == 0) { return false; }

//   for (let i = 2; i < n; i++) {
//     if (n % i == 0) { return false; }
//   }
//   return true
// }


// // console.log(isPrime(2))

// function sumOfNPrimes(n) {
//   var sum = 0;
//   var z = 0;
//   var i = 0;
//   while (z < n) {
//     if ( isPrime(i) ) { sum += i; z += 1; }
//     i++;
//   }
//   return sum;

// }

// console.log(sumOfNPrimes(4))

// titleize(["Mary", "Brian", "Leo"], printCallback);

// function printCallback(arr) {
//   arr.forEach(element => {
//     console.log(element); 
//   });
// }

// function titleize(arr, cb) {
//   mapped = arr.map((name) => {
//     return `Mx. ${name} Jingleheimer Schmidt`;
//   });

//   cb(mapped);
// }

class Elephant {
  constructor(name, height) {
    this.name = name;
    this.height = height;
    this.tricks = [];
  }
}

Elephant.prototype.trumpet = () => {
  return this
  return `${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`
}

// Elephant.prototype = {
//   trumpet: () => { return "hello"; },
//   grow: () => { this.height += 12 },
//   addTrick: trick => { this.array.push(trick) }
//   // play: this.array[ Math.floor(this.array.length * Math.random()) ]
// }

var elle = new Elephant('elle', 2)
console.log(elle.trumpet())















