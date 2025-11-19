<?php

namespace Dockworker\Robo\Plugin\Commands;

use Dockworker\DockworkerDaemonCommands;

/**
 * Defines the commands used to interact with a deployed Redis application.
 */
class RedisDeploymentCommands extends DockworkerDaemonCommands {
    /**
     * Provides the error log exceptions for the Redis deployment.
     *
     * @hook on-event dockworker-logs-errors-exceptions
     *
     * @return mixed[]
     *   The error log exceptions.
     */
    public function provideErrorLogConfigurations(): array
    {
        return [
            [],
            array_values(
                [
                    // Redis exceptions.
                    'Expected on local' => 'WARNING Memory overcommit must be enabled',
                ]
            ),
        ];
    }
}