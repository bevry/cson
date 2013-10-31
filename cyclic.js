// v1.3.0 October 26, 2013
// https://github.com/bevry/base
if ( require('fs').existsSync('.git') ) {
	require('child_process').spawn(
		process.platform.indexOf('win') === 0 ? process.execPath.replace('node.exe', 'npm.cmd') : 'npm',
		['install', '--force', require('./package.json').name],
		{env:process.env, cwd:process.cwd(), stdio:'inherit'}
	).on('error', console.log).on('close', console.log);
}