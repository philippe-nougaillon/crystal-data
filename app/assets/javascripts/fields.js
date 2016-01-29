  $(document).ready(function(){
    $("#field_items").css('display','none')

    if($('#field_datatype').val() == "liste" || $('#field_datatype').val() == "formule"){
      $("#field_items").css('display','inline')
    } 

    $('#field_datatype').change(function(){
      if($('#field_datatype').val() == "liste"){
          $("#field_items").css('display','inline')
          $("#field_items").attr('placeholder','Entrez les éléments de la liste séparés par une virgule')
       } else {
          if($('#field_datatype').val() == "formule"){
              $("#field_items").css('display','inline')
              $("#field_items").attr('placeholder',"Entrez une formule (ex: [1]+[2] pour additionner la colonne #1 avec la colonne #2)")
           } else {
              $("#field_items").css('display','none')
           }
       }
    })

    $(".field_sum").css('display','none')
    if($('#field_datatype').val() == "nombre" || $('#field_datatype').val() == "euros"){
      $(".field_sum").css('display','inline')
    }
    $('#field_datatype').change(function(){
      if($('#field_datatype').val() == "nombre" || $('#field_datatype').val() == "euros"){
          $(".field_sum").css('display','inline')
       } else {
          $(".field_sum").css('display','none')
       }
    })

  });
