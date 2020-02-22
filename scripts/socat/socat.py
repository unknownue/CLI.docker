
from workflow import Workflow3, ICON_INFO
from workflow.background import run_in_background, is_running

def main(wf):
    process_name = 'docker-socat'

    if not is_running(process_name):
        run_in_background(process_name, ['/usr/bin/bash', 'socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"'])

    # Send results to Alfred
    wf.send_feedback()

if __name__ == '__main__':
    # Use Workflow3 so we can use Alfred 3's awesome `rerun` feature
    wf = Workflow3()
    wf.run(main)
