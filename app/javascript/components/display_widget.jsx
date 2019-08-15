import React from "react"
import { Helmet } from "react-helmet"

export default function DisplayWidget(props) {
  const { data, name } = props
	let dataArray = data.split('</div>')

	const isolateScript = dataArray[dataArray.length - 1]
		.replace('<script type="text/javascript">', '')
		.replace('</script>', '')

	return (
		<div style={{ flex: 1 }}>
			<Helmet
				script={[
					{
						type: 'text/javascript',
						innerHTML: isolateScript,
					},
				]}
			/>

      <h2>{name}</h2>
      <p>(resources)</p>

			<div id="resources_calendar_widget" className="styled">
				<div className="loader">Loading...</div>
			</div>
		</div>
	)
}
