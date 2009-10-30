document.observe("dom:loaded", function() {
  when('attachments', function(container) {
    container.observe('click', function(e) {
      var target = $(e.target)
      
      if (target.match('img[alt=Add]')) {
		var rand = Math.floor(Math.random()*10000)
		var upload = '<div class="attachment-upload">\
					    <p class="title"> Upload File </p>\
						<label for="employee_page_attachments_attributes_' + rand + '_title">Title</label>\
						<input type="text" size="30" name="employee[page_attachments_attributes][' + rand + '][title]" id="employee_page_attachments_attributes_'+ rand + '_title"/>\
						<label for="employee_page_attachments_attributes_' + rand + '_title">Description</label>\
						<input type="text" size="30" name="employee[page_attachments_attributes][' + rand + '][description]" id="employee_page_attachments_attributes_'+ rand + '_description"/>\
						<label for="employee_page_attachments_attributes_' + rand + '_description">File</label>\
						<input type="file" size="30" name="employee[page_attachments_attributes][' + rand + '][uploaded_data]" id="employee_page_attachments_attributes_'+ rand + 'uploaded_data"/>\
						<img alt="cancel" src="/images/admin/minus.png"/>\
					  </div>'
        container.insert(upload);
      }
	 else if (target.match('img[alt=cancel]')) {
        e.findElement('.attachment-upload').remove()
        e.stop()
      }
	 else if (target.match('img.delete')) {
       if (confirm("Really delete this attachment? This will take effect immediately.")) {
         var attachment = e.findElement('.attachment')
         var id = attachment.id.split('_').last()
         new Ajax.Updater('attachment_list','/page_attachments/destroy/', {method:'post', parameters:{id: id, authenticity_token: auth_token}})
		 var attach_count = $('attachment_count')
		 attach_count.update(parseInt(attach_count.innerHTML) - 1) 
       }
	 }
    })
  })
})
