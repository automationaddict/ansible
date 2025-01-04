
# Justfile
# This Justfile prompts for the playbook file and runs the Ansible playbook

# Define the inventory file
INVENTORY := inventory/production

# Define the ansible-playbook command
ANSIBLE_PLAYBOOK := ansible-playbook

# Function to prompt for the playbook file
prompt_playbook = `
    echo "Enter the playbook file:"
    read playbook_file
    echo $playbook_file
`

# Task to run the Ansible playbook
run:
    @playbook_file=$(prompt_playbook)
    @if [ -z "$$playbook_file" ]; then \
        echo "No playbook file provided. Exiting..."; \
        exit 1; \
    fi
    @echo "Running Ansible playbook $$playbook_file..."
    $(ANSIBLE_PLAYBOOK) -i $(INVENTORY) $$playbook_file

# Task to run the Ansible playbook with verbosity
run-verbose:
    @playbook_file=$(prompt_playbook)
    @if [ -z "$$playbook_file" ]; then \
        echo "No playbook file provided. Exiting..."; \
        exit 1; \
    fi
    @echo "Running Ansible playbook $$playbook_file with verbosity..."
    $(ANSIBLE_PLAYBOOK) -i $(INVENTORY) $$playbook_file -v

# Task to check the Ansible playbook
check:
    @playbook_file=$(prompt_playbook)
    @if [ -z "$$playbook_file" ]; then \
        echo "No playbook file provided. Exiting..."; \
        exit 1; \
    fi
    @echo "Checking Ansible playbook $$playbook_file..."
    $(ANSIBLE_PLAYBOOK) -i $(INVENTORY) $$playbook_file --check

# Task to list the hosts
list-hosts:
    @playbook_file=$(prompt_playbook)
    @if [ -z "$$playbook_file" ]; then \
        echo "No playbook file provided. Exiting..."; \
        exit 1; \
    fi
    @echo "Listing hosts for $$playbook_file..."
    $(ANSIBLE_PLAYBOOK) -i $(INVENTORY) $$playbook_file --list-hosts

# Task to list the tasks
list-tasks:
    @playbook_file=$(prompt_playbook)
    @if [ -z "$$playbook_file" ]; then \
        echo "No playbook file provided. Exiting..."; \
        exit 1; \
    fi
    @echo "Listing tasks for $$playbook_file..."
    $(ANSIBLE_PLAYBOOK) -i $(INVENTORY) $$playbook_file --list-tasks
