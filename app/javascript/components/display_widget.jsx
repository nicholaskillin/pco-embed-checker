import React from "react"
import { Helmet } from "react-helmet"

export default function DisplayWidget(props) {
	const { data, name } = props
	let dataArray = data.split('</div>')

	const isolateScript = dataArray[dataArray.length - 1]
		.replace('<script type="text/javascript">', '')
		.replace('</script>', '')

	return (
		<div className="integration-details">
			<Helmet
				script={[
					{
						type: 'text/javascript',
						innerHTML: isolateScript,
					},
				]}
			/>

      <div className="d-f ai-c jc-fs mb-2">
				<h2>{name}</h2>
			</div>

			<div id="resources_calendar_widget" className="styled">
				<div className="loader">Loading...</div>
			</div>
		</div>
	)
}
