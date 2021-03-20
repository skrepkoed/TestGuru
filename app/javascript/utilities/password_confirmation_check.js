document.addEventListener('turbolinks:load', function() {

  let confirmations = document.querySelectorAll('[id$=_confirmation]')
  
  let confirmationsFields=[]

  for (var i = 0; i < confirmations.length; i++) {
    confirmationsFields.push([confirmations[i], document.querySelector(`#${attributeForConfirmation(confirmations[i])}`)])
  }
  confirmationsFields.forEach(addListener)

})

  function attributeForConfirmation(atr){
    let str = atr.attributes.id.value
    return str.substring( 0, str.indexOf( "_confirmation" ) )
  }

  function addListener(elements){
    elements.forEach(addInputListener)
  }

  function addInputListener(element){ 
    element.addEventListener('input', inputConfirmation)
  }

  function inputConfirmation(e){
    console.log(e.target.value)
  }
  