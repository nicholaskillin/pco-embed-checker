import React from "react"
import { string } from "prop-types"

export default class DisplayWidget extends React.Component {
	static propTypes = {
		data: string.isRequired,
		name: string.isRequired,
	}

	constructor(props) {
		super(props)

		this.state = {
			hasScript: true,
		}
	}

	componentDidMount() {
		const dataArray = this.props.data.split('"')

		const script = document.createElement("script")
		script.src = dataArray[dataArray.length - 4]
		script.async = true

		document.body.appendChild(script)
	}

	render() {
		const { name } = this.props

		return (
			<div className="integration-details">
				<div className="d-f ai-c jc-fs mb-2">
					<h2>{name}</h2>
				</div>

				<div id="resources_calendar_widget" className="styled">
					<div className="loader">Loading...</div>
				</div>
			</div>
		)
	}
}
