class Notifications
	constructor: ->
		console.log ($("[data-behavior='notifications']"))
		@notifications = $("[data-behavior='notifications']")
		@setup() if @notifications.length > 0

	setup: ->
		console.log("setup")
		$("[data-behavior='notifications-link']").on "click", @handleClick
		$.ajax(
			url: "/notifications.json"
			dataType: "JSON"
			method: "GET"
			success: @handleSuccess
		)

	handleClick: (e) =>
		$.ajax(
			url: "/notifications/mark_as_read"
			dataType: "JSON"
			method: "POST"
			success: ->
				$("[data-behavior='unread-count']").text(0)
			)

	handleSuccess: (data) =>
		console.log(data)
		items = $.map data, (notification) ->
			"<a class='dropdown-item' href='#'>#{notification.action}</a>"

		$("[data-behavior='unread-count']").text(items.length)
		$("[data-behavior='notification-items']").html(items)

jQuery ->
	console.log("hello")
	new Notifications