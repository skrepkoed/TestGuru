document.addEventListener('turbolinks:load', function() {

  let confirmations = document.querySelectorAll('[id$=_confirmation]')
  if (confirmations){
  let confirmationsFields=[]

  for (var i = 0; i < confirmations.length; i++) {
    confirmationsFields.push([confirmations[i], document.querySelector(`#${attributeForConfirmation(confirmations[i])}`)])
  }
  
  confirmationsFields.forEach(addListener)
  }
})

  function attributeForConfirmation(atr){
    let str = atr.attributes.id.value
    return str.substring( 0, str.indexOf( "_confirmation" ) )
  }

  function addListener(elements){
    elements.forEach(addInputListener)
  }

  function addInputListener(element,index,array){
    element.addEventListener('input', item => inputConfirmation(item, array))
  }

  function inputConfirmation(element, array){
    let confirmation_field_icon = array.filter(item => item.id.includes('_confirmation'))[0].parentNode
    if (array.every(item => element.target.value===item.value)){
    
      confirmation_field_icon.querySelector('.octicon-check').classList.remove('hide')
      confirmation_field_icon.querySelector('.octicon-x').classList.add('hide')
    
    }else{
      
      confirmation_field_icon.querySelector('.octicon-x').classList.remove('hide')
      confirmation_field_icon.querySelector('.octicon-check').classList.add('hide')
    }

    if (array.some(item => (item.value==''))) {
      
      confirmation_field_icon.querySelector('.octicon-check').classList.add('hide')
      confirmation_field_icon.querySelector('.octicon-x').classList.add('hide')
    }
    
  }

  
  