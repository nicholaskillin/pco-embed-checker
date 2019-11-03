import React from "react"
import { Helmet } from "react-helmet"
import ReactSVG from 'react-svg'

import GivingBadge from '../../assets/images/giving.svg'
import PeopleBadge from '../../assets/images/people.svg'

export default function DisplayForm(props) {
	const { data, app, name } = props
	const script = `https://js.churchcenter.com/modal/v1`
	const url = data.replace(/\s/g, '')

	return (
		<div className="embed-details d-f fd-c fd-r@md jc-sb@md ai-c@md">
			<Helmet
				script={[
					{
						type: 'text/javascript',
						src: script,
					},
				]}
			/>
			<div className="d-f ai-c jc-fs f-1">
				<div className="p-r" style={{ top: 2 }}>
					{app === "giving" && <ReactSVG src={GivingBadge} />}
					{app === "people" && <ReactSVG src={PeopleBadge} />}
				</div>
				<h2>{name}</h2>
			</div>

			<div className="d-b d-ib@md mt-3 mt-0@md">
				<a
					href={url}
					data-open-in-church-center-modal="true"
					className="btn btn--secondary btn--sm mr-2"
				>
					Open modal
				</a>
				<a
					href={url}
					rel="noopener noreferrer"
					target="_blank"
					className="btn btn--secondary btn--sm"
				>
					Open new tab
				</a>
			</div>
		</div>
	)
}
