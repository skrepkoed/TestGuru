document.addEventListener('turbolinks:load', function () {
 let progressBar = document.querySelector('.progress-bar')
 if (progressBar) {
   let totalQuestions = progressBar.dataset.totalQuestions
   let currentQuestionNumber = progressBar.dataset.questionNumber
   let completed = progressBar.dataset.completed === 'true'
   if (!completed) {
     var percent = Math.round(((currentQuestionNumber-1)/totalQuestions)*100)
    }else{var percent = 100}
    progressBar.style.width = `${percent}%`
   console.log(progressBar.style)
  }
})