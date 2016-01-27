
  $(document).ready(function () {

    var ResourceUploader = function(triggerSelector, inputSelector, holder) {
      var trigger = $(triggerSelector);
      var input = $(inputSelector);

      $(trigger).on("click", function () {
          input.click();
      });

      input.change(function() {
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(event) {
            var url = "url(" + event.target.result + ")"
            $(holder).css("background-image", url);
          }
          reader.readAsDataURL(this.files[0]);
        }
      });
    }

    var FeatureImageUploader = function(triggerSelector, inputSelector, name, holder) {
      var trigger = $(triggerSelector);
      var input = $(inputSelector);

      $(trigger).on("click", function () {
          console.log("hi");
          input.click();
      });

      input.change(function() {
        if (this.files && this.files[0]) {
          $(name).html(input.val());
          var reader = new FileReader();
          reader.onload = function(event) {
            var url = "url(" + event.target.result + ")"
            $(holder).css("background-image", url);
          }
          reader.readAsDataURL(this.files[0]);
        }
      });
    }

    // project attachment uploader
    ResourceUploader('#resources-upload .upload-trigger'
    ,'.project_project_attachments_resource input[type="file"]'
    ,"#attachment-holder");

    // feature image uploader
    FeatureImageUploader('#important-stuff .upload-trigger',
    '#important-stuff-upload input[type="file"]',
    '#filename',
    '#important-stuff-upload');


    /** The Slider section - Fileupload Plugin Initialization**/
    function doSlideUploads() {
      $('.slide-upload').off();
      $('.slide-upload').on("click", function (e) {
        if ($(e.target).is('.slide-upload')) {
          var input = $(this).find('input[type="file"]');
          input.click(); // Simulate a click on the file input button to show the file browser dialog

          input.change(function() {
            if (this.files && this.files[0]) {
              var reader = new FileReader();
              reader.onload = function(event) {
                var url = "url(" + event.target.result + ")"
                input.parent().parent().css("background-image", url);
              }
              reader.readAsDataURL(this.files[0]);
            }
          });

        } else console.log("wrong")
      });
    }

    doSlideUploads();

    // Prevent the default action when a file is dropped on the window
    $(document).on('drop dragover', function (e) {
      e.preventDefault();
    });

    /** Sortable (or) movable  Plugin Initialization **/
    $('.panel-sortable').sortable({
      items: ':not(.sort-disabled)', //  to specifiy which items inside the element should be sortable:
      placeholderClass: 'placeholde-class',
      forcePlaceholderSize: true,
      hoverClass: 'is-hovered' // Defaults to false
      //handle: '.drag-icon' //to restrict drag start to the specified element:
    })
    .bind('sortstop', function(e, ui) {
      var formOrderForm = $('#form-order');
      var formOrder = "";
      $(ui.startparent).find("[data-moveid]").each(function(index,element) {
        formOrder += $(element).attr("data-moveid");
      });
      formOrderForm.val(formOrder);
      console.log(formOrderForm.val())
    });

    draggableFormFields();

    function draggableFormFields() {

      $('.draggable-form-fields').sortable({
        forcePlaceholderSize: true, items: ':not(.sort-disabled)', //  to specifiy which items inside the element should be sortable:
        placeholderClass: 'placeholde-class',
        hoverClass: 'is-hovered' // Defaults to false
        //handle: '.drag-icon-inner' //to restrict drag start to the specified element:
      })
      .bind('sortstop', function(e, ui) {
        var elements = $(ui.startparent).find('.position');
        elements.each(function(index, element) {
          console.log(index, element);
          $(element).val(index);
        });
      });
    }

    $('body').on('click', 'a.add-proj-field', function (e) {
      var time = new Date().getTime()
      var regexp = new RegExp($(this).data('id'), 'g')
      $(this).parent().before($(this).data('fields').replace(regexp, time));
      e.preventDefault()
      draggableFormFields(); // re-initialize draggable formfields
    });

    $('body').on('click', 'a.add-slider', function (e) {
      var time = new Date().getTime()
      var regexp = new RegExp($(this).data('id'), 'g')
      $(this).before($(this).data('fields').replace(regexp, time));
      doSlideUploads();
      e.preventDefault()
    });

    /** Problem Slidshow Initialization **/
    $('.problem-slideshow').cycle({
      slides: '> div',
      swipe: true,
      fx: 'scrollHorz', //  fade, fadeout, none, and scrollHorz.
      timeout: 5000,
      speed: 500,
      log: false,
      pager: '#problem-slideshow-pager',
      'pager-template': '<span></span>'
    });

    $('.problem-slideshow').cycle('stop'); // stop auto slideshow

    $('.resource-item').on('click', function() {
      console.log("boom");
      $(this).find('input').click();
    })

  });
