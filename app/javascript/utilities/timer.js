document.addEventListener('turbolinks:load', function () {

  let timer = document.querySelector('.timer')
  let time_left = timer.dataset.timeLeft
  testTimer(time_left)
})

function testTimer(time_left) {
  let minutes = Math.ceil(time_left/60)
  let seconds = Math.floor(time_left%60)
  let m = setInterval(minutes=minuteTimer(minutes), 60000)
  let s = setInterval(seconds=secondTimer(seconds), 1000)
  console.log(minutes+' '+seconds)
}

function minuteTimer(minutes) {
 console.log( minutes-1)
}

function secondTimer(seconds) {

   console.log(seconds - 1)
}