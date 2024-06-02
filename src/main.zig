const std = @import("std");
const yazap = @import("yazap");
const App = yazap.App;
const Arg = yazap.Arg;
const log = std.log;
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var app = App.init(allocator, "test-yazap", "test-command");
    defer app.deinit();

    var test_yazap = app.rootCommand();

    try test_yazap.addArg(Arg.booleanOption("version", null, null));

    const matches = try app.parseProcess();

    if (matches.containsArg("version")) {
        try stdout.print("v0.1.0\n", .{});
        return;
    } else {
        try stdout.print("Foo!!\n", .{});
    }
}
