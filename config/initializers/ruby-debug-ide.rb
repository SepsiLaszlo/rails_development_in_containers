if defined?(Debugger::MultiProcess)
  Debugger::MultiProcess.module_eval do
    class << self
      def find_free_port(host)
        server = TCPServer.open(host, 58438)
        port   = server.addr[1]
        server.close
        port
      end
    end
  end
end