$(document).on('turbolinks:load', () => {
	$('div.button-wrapper').on('click', 'button#update-entries-button', () => {
		const approved = []
		const notApproved = []
		const canceled = []
		const notCanceled = []

		$('table.entries input.approved').each((index, elem) => {
			const id = $(elem).data('entry-id')
			if ($(elem).prop('checked')) approved.push(id)
			else notApproved.push(id)
		})

		$('#form_approved').val(approved.join(':'))
		$('#form_not_approved').val(notApproved.join(':'))

		$('table.entries input.canceled').each((index, elem) => {
			const id = $(elem).data('entry-id')
			if ($(elem).prop('checked')) canceled.push(id)
			else notCanceled.push(id)
		})

		$('#form_canceled').val(canceled.join(':'))
		$('#form_not_canceled').val(notCanceled.join(':'))

		$('div.button-wrapper form').submit()
	})
})
